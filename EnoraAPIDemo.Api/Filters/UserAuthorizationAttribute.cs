using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Net.Http;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Services;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json.Linq;
using System.Linq;
using System.Security.Claims;
using System.Collections.Generic;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Utility;

namespace EnoraAPIDemo.Api.Attributes
{
    [AttributeUsage(validOn: AttributeTargets.Class | AttributeTargets.Method)]
    public class UserAuthorizationAttribute : Attribute, IAsyncActionFilter
    {
        private const string APIKEYNAME = "ApiKey";
        private const string AUTHORIZATION = "Authorization";
        private  string _directoryPath;
        private  ILogger _logger;
        private  ILogger _loggerInfo;
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            _directoryPath = AppDomain.CurrentDomain.BaseDirectory;
            _logger = new Logger(_directoryPath, LOGConstants.UNAUTHORIZED_FILE_NAME);
            _loggerInfo = new Logger(_directoryPath, LOGConstants.AUTHORIZATION_FILE_NAME);
            string UserName = "";
            string controllerName = (string)context.RouteData.Values["Controller"];
            string actionName = (string)context.RouteData.Values["Action"];
            try
            {
                IJwtAuthManager _jwtAuthManager = context.HttpContext.RequestServices.GetRequiredService<IJwtAuthManager>();
                IMasterServices _masterService = context.HttpContext.RequestServices.GetRequiredService<IMasterServices>();

                bool isAPIKey = context.HttpContext.Request.Headers.TryGetValue(APIKEYNAME, out var extractedApiKey);
                int RoleId = 0;
                
                if (isAPIKey)
                {
                    User user = await _masterService.GetUserByAPIKey(extractedApiKey.ToString());

                    var claims = new[] {
                            new Claim("UserID",user.Id.ToString()),
                            new Claim("Name",user.UserId),
                            new Claim("ClientAccountId",user.ClientAccountId.ToString()),
                            new Claim("Role", user.RoleId.ToString())
                    };
                    RoleId = user.RoleId;
                    UserName = user.UserId;
                    context.HttpContext.User.AddIdentity(new ClaimsIdentity(claims));
                }
                else
                {
                    string token = context.HttpContext.Request.Headers[AUTHORIZATION];
                    if (token == null && isAPIKey == false)
                    {
                        return;
                    }
                    var data = _jwtAuthManager.DecodeJwtToken(token.Replace("Bearer ", ""));

                    var jwtSecurityToken = data.Item2;
                    var claims = jwtSecurityToken.Claims;
                    var roleId = claims.Where(c => c.Type == "Role").Select(c => c.Value).FirstOrDefault();
                    RoleId = Convert.ToInt32(roleId);

                    context.HttpContext.User.AddIdentity(new ClaimsIdentity(claims));
                }
                //.Result which will wait until Task completes and return a result.
                bool IsValid = _masterService.ClaimAction(controllerName, actionName, RoleId).Result;
                if (IsValid == false)
                {
                     context.Result = new UnauthorizedObjectResult("Unauthorized Access");
                    _logger.WriteErrorLog(LogType.ERROR, "-------------------------------------------Unauthorized Access-------------------------------------------------");
                    _logger.WriteErrorLog("UserName: " + UserName);
                    _logger.WriteErrorLog("Controller: " + controllerName);
                    _logger.WriteErrorLog("Method: " + actionName);
                    return;
                }
            }
            catch (Exception ex)
            {
                context.Result = new UnauthorizedObjectResult("Unauthorized Access");
                _logger.WriteErrorLog(LogType.ERROR, "-------------------------------------------Unauthorized Access-------------------------------------------------");
                _logger.WriteErrorLog("UserName: " + UserName);
                _logger.WriteErrorLog("Controller: " + controllerName);
                _logger.WriteErrorLog("Method: " + actionName);
                _logger.WriteErrorLog(ex.Message.ToString());
                _logger.WriteErrorLog(ex.StackTrace.ToString());
                return;
            }
            _loggerInfo.WriteErrorLog(LogType.INFO, $"[{UserName}] Authorization  Access in the system.Controller: " + controllerName + ",Method: " + actionName);
            await next();
        }

    }

}