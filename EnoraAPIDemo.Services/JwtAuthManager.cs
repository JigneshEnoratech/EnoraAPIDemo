using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Core.Models;

namespace EnoraAPIDemo.Services
{
    public class JwtAuthManager : IJwtAuthManager
    {
        public IImmutableDictionary<string, RefreshToken> UsersRefreshTokensReadOnlyDictionary => _usersRefreshTokens.ToImmutableDictionary();
        private readonly ConcurrentDictionary<string, RefreshToken> _usersRefreshTokens;  // can store in a database or a distributed cache
        private readonly JwtTokenConfig _jwtTokenConfig;
        private readonly byte[] _secret;

        public JwtAuthManager(JwtTokenConfig jwtTokenConfig)
        {
            _jwtTokenConfig = jwtTokenConfig;
            _usersRefreshTokens = new ConcurrentDictionary<string, RefreshToken>();
            _secret = Encoding.ASCII.GetBytes(jwtTokenConfig.Secret);
        }

        public JwtAuthResult GenerateTokens(string username, Claim[] claims, DateTime now)
        {
            var shouldAddAudienceClaim = string.IsNullOrWhiteSpace(claims?.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Aud)?.Value);

            var jwtToken = new JwtSecurityToken(
                _jwtTokenConfig.Issuer,
                shouldAddAudienceClaim ? _jwtTokenConfig.Audience : string.Empty,
                claims,
                expires: now.AddMinutes(_jwtTokenConfig.AccessTokenExpiration),
                signingCredentials: new SigningCredentials(new SymmetricSecurityKey(_secret), SecurityAlgorithms.HmacSha256Signature));
            var accessToken = new JwtSecurityTokenHandler().WriteToken(jwtToken);

            var refreshToken = new RefreshToken
            {
                UserName = username,
                TokenString = GenerateRefreshTokenString(),
                ExpireAt = now.AddMinutes(_jwtTokenConfig.RefreshTokenExpiration)
            };
            _usersRefreshTokens.AddOrUpdate(refreshToken.TokenString, refreshToken, (s, t) => refreshToken);

            return new JwtAuthResult
            {
                AccessToken = accessToken,
                RefreshToken = refreshToken
            };
        }

        private static string GenerateRefreshTokenString()
        {
            var randomNumber = new byte[32];
            using var randomNumberGenerator = RandomNumberGenerator.Create();
            randomNumberGenerator.GetBytes(randomNumber);
            return Convert.ToBase64String(randomNumber);
        }

        public JwtAuthResult Refresh(string refreshToken, string accessToken, DateTime now)
        {
            var (principal, jwtToken) = DecodeExpiredJwtToken(accessToken);

            if (jwtToken == null || !jwtToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256Signature))
            {
                throw new SecurityTokenException("Invalid token");
            }

            var claims = jwtToken.Claims;
            var userName = claims.Where(c => c.Type == "Name").Select(c => c.Value).FirstOrDefault();
            return GenerateTokens(userName, principal.Claims.ToArray(), now); // need to recover the original claims

        }

        // optional: clean up expired refresh tokens
        public void RemoveExpiredRefreshTokens(DateTime now)
        {
            var expiredTokens = _usersRefreshTokens.Where(x => x.Value.ExpireAt < now).ToList();
            foreach (var expiredToken in expiredTokens)
            {
                _usersRefreshTokens.TryRemove(expiredToken.Key, out _);
            }
        }

        // can be more specific to ip, user agent, device name, etc.
        public void RemoveRefreshTokenByUserName(string userName)
        {
            var refreshTokens = _usersRefreshTokens.Where(x => x.Value.UserName == userName).ToList();
            foreach (var refreshToken in refreshTokens)
            {
                _usersRefreshTokens.TryRemove(refreshToken.Key, out _);
            }
        }
        public (ClaimsPrincipal, JwtSecurityToken) DecodeJwtToken(string token)
        {
            if (string.IsNullOrWhiteSpace(token))
            {
                throw new SecurityTokenException("Invalid token");
            }
            var principal = new JwtSecurityTokenHandler()
                .ValidateToken(token,
                    new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidIssuer = _jwtTokenConfig.Issuer,
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(_secret),
                        ValidAudience = _jwtTokenConfig.Audience,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ClockSkew = TimeSpan.FromMinutes(1)
                    },
                    out var validatedToken);

            return (principal, validatedToken as JwtSecurityToken);

        }

        public (ClaimsPrincipal, JwtSecurityToken) DecodeExpiredJwtToken(string token)
        {
            if (string.IsNullOrWhiteSpace(token))
            {
                throw new SecurityTokenException("Invalid token");
            }
            var principal = new JwtSecurityTokenHandler()
                .ValidateToken(token,
                    new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidIssuer = _jwtTokenConfig.Issuer,
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(_secret),
                        ValidAudience = _jwtTokenConfig.Audience,
                        ValidateAudience = true,
                        ValidateLifetime = false,
                        ClockSkew = TimeSpan.FromMinutes(1)
                    },
                    out var validatedToken);
            return (principal, validatedToken as JwtSecurityToken);
        }

        public bool CheckExpiredJwtToken(string token)
        {
            if (string.IsNullOrWhiteSpace(token))
            {
                throw new SecurityTokenException("Invalid token");
            }
            try
            {
                var principal = new JwtSecurityTokenHandler()
                    .ValidateToken(token,
                        new TokenValidationParameters
                        {
                            ValidateIssuer = true,
                            ValidIssuer = _jwtTokenConfig.Issuer,
                            ValidateIssuerSigningKey = true,
                            IssuerSigningKey = new SymmetricSecurityKey(_secret),
                            ValidAudience = _jwtTokenConfig.Audience,
                            ValidateAudience = true,
                            ValidateLifetime = true,
                            ClockSkew = TimeSpan.FromMinutes(1)
                        },
                        out var validatedToken);

                return false;
            }
            catch (SecurityTokenExpiredException)
            {
                return true;
            }
            catch (Exception)
            {
                return true;
            }
        }


        public bool ValidateToken(string token)
        {
            if (string.IsNullOrWhiteSpace(token))
            {
                throw new SecurityTokenException("Invalid token");
            }

            try
            {
                var principal = new JwtSecurityTokenHandler()
                    .ValidateToken(token,
                        new TokenValidationParameters
                        {
                            ValidateIssuer = true,
                            ValidIssuer = _jwtTokenConfig.Issuer,
                            ValidateIssuerSigningKey = true,
                            IssuerSigningKey = new SymmetricSecurityKey(_secret),
                            ValidAudience = _jwtTokenConfig.Audience,
                            ValidateAudience = true,
                            ValidateLifetime = true,
                            ClockSkew = TimeSpan.FromMinutes(1)
                        },
                        out var validatedToken);

                return true;
            }
            catch (SecurityTokenExpiredException ex)
            {
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }


    }
}
