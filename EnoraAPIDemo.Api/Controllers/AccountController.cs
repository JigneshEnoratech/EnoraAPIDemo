using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Services;

namespace EnoraAPIDemo.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase
    {
        private readonly ILogger<AccountController> _logger;
        private readonly IUserService _userService;
        private readonly IJwtAuthManager _jwtAuthManager;

        public AccountController(ILogger<AccountController> logger, IUserService userService, IJwtAuthManager jwtAuthManager)
        {
            _logger = logger;
            _userService = userService;
            _jwtAuthManager = jwtAuthManager;
        }

        [HttpPost("login")]
        public async Task<ActionResult> Login([FromBody] LoginRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
            int userid;
            try
            {
                AuthenticateReturn authenticate = await _userService.IsAuthenticated(request);
                if (!authenticate.isAuthenticate)
                {
                    return Unauthorized();
                }
                userid = authenticate.UserID;
            }
            catch (Exception ex)
            {
                _logger.LogInformation($"Error [{ex}]");
                return Unauthorized();
            }


            var role = await _userService.GetUserRole(request.UserName);
            var clientAccointId = await _userService.GetClientAccountId(request.UserName);

            var claims = new[]
            {
                new Claim("UserID",userid.ToString()),
                new Claim("Name",request.UserName),
                new Claim("ClientAccountId",clientAccointId.ToString()),
                new Claim("Role", role.ToString())

            };

            var jwtResult = _jwtAuthManager.GenerateTokens(request.UserName, claims, DateTime.Now);
            _logger.LogInformation($"User [{request.UserName}] logged in the system.");
            return Ok(new LoginResult
            {
                UserName = request.UserName,
                Role = role.ToString(),
                AccessToken = jwtResult.AccessToken,
                RefreshToken = jwtResult.RefreshToken.TokenString
            });
        }


        [HttpPost("getToken")]
        public async Task<ActionResult> GetToken([FromBody] ApiRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
            AuthenticateReturn authenticate = await _userService.IsAuthenticated(request);
            if (!authenticate.isAuthenticate)
            {
                return Unauthorized();
            }

            var role = await _userService.GetUserRole(authenticate.UserName);
            var clientAccointId = await _userService.GetClientAccountId(authenticate.UserName);

            var claims = new[]
            {
                new Claim("UserID",authenticate.UserID.ToString()),
                new Claim("Name",authenticate.UserName),
                new Claim("ClientAccountId",clientAccointId.ToString()),
                new Claim("Role", role.ToString())

            };

            var jwtResult = _jwtAuthManager.GenerateTokens(authenticate.UserName, claims, DateTime.Now);
            _logger.LogInformation($"User [{authenticate.UserName}] logged in the system.");
            return Ok(new LoginResult
            {
                UserName = authenticate.UserName,
                Role = role.ToString(),
                AccessToken = jwtResult.AccessToken,
                RefreshToken = jwtResult.RefreshToken.TokenString
            });
        }


        [HttpGet("user")]
        public ActionResult GetCurrentUser()
        {
            return Ok(new LoginResult
            {
                UserID =Convert.ToInt32(User.FindFirst("ClientAccountID")?.Value),
                UserName = User.Identity.Name,
                Role = User.FindFirst(ClaimTypes.Role)?.Value ?? string.Empty,
                OriginalUserName = User.FindFirst("OriginalUserName")?.Value
            });
        }

        [HttpPost("logout")]
        public ActionResult Logout()
        {
            // optionally "revoke" JWT token on the server side --> add the current token to a block-list
            // https://github.com/auth0/node-jsonwebtoken/issues/375

            var userName = User.Identity.Name;
            _jwtAuthManager.RemoveRefreshTokenByUserName(userName);
            _logger.LogInformation($"User [{userName}] logged out the system.");
            return Ok();
        }

        [HttpPost("refreshtoken")]
        public async Task<ActionResult> RefreshToken([FromBody] RefreshTokenRequest request)
        {
            try
            {
                string token = HttpContext.Request.Headers["Authorization"];
                var accessToken = token.Replace("Bearer ", "");


                if (string.IsNullOrWhiteSpace(accessToken))
                {
                    return Unauthorized();
                }

                var (principal, jwtToken) = _jwtAuthManager.DecodeExpiredJwtToken(accessToken);

                var claims = jwtToken.Claims;
                var userName = claims.Where(c => c.Type == "Name").Select(c => c.Value).FirstOrDefault();
                var userRole = claims.Where(c => c.Type == "Role").Select(c => c.Value).FirstOrDefault();
                var userID = claims.Where(c => c.Type == "UserID").Select(c => c.Value).FirstOrDefault();

                //var tokenExpiryTime = Convert.ToDouble(jwtToken.ValidTo).UnixTimeStampToDateTime();
                var tokenExpiryTime = jwtToken.ValidTo;
                var currentTime = DateTime.UtcNow;
                if (tokenExpiryTime < currentTime)
                {
                    //token expried
                    _logger.LogInformation($"User [{userName}] is trying to refresh JWT token.");

                    if (string.IsNullOrWhiteSpace(request.RefreshToken))
                    {
                        return Unauthorized();
                    }

                    var jwtResult = _jwtAuthManager.Refresh(request.RefreshToken, accessToken, DateTime.Now);

                    _logger.LogInformation($"User [{userName}] has refreshed JWT token.");
                    return Ok(new LoginResult
                    {
                        UserID = Convert.ToInt32(userID),
                        UserName = userName,
                        Role = userRole,
                        AccessToken = jwtResult.AccessToken,
                        RefreshToken = jwtResult.RefreshToken.TokenString
                    });
                }
                else
                {
                    return Unauthorized();
                }
            }
            catch (SecurityTokenException e)
            {
                return Unauthorized(e.Message); // return 401 so that the client side can redirect the user to login page
            }
            catch (Exception e)
            {
                return Unauthorized(e.Message);
            }
        }
    }
}
