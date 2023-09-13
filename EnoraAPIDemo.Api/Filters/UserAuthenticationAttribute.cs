using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Utility;

namespace EnoraAPIDemo.Api.Attributes
{
    [AttributeUsage(validOn: AttributeTargets.Class | AttributeTargets.Method)]
    public class UserAuthenticationAttribute : Attribute, IAsyncActionFilter
    {
        private const string APIKEYNAME = "ApiKey";
        private const string AUTHORIZATION = "Authorization";
        private string _directoryPath;
        private ILogger _logger;
        private ILogger _loggerInfo;
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            _directoryPath = AppDomain.CurrentDomain.BaseDirectory;
            _logger = new Logger(_directoryPath, LOGConstants.UNAUTHORIZED_FILE_NAME);
            _loggerInfo = new Logger(_directoryPath, LOGConstants.AUTHORIZATION_FILE_NAME);
            IJwtAuthManager _jwtAuthManager = context.HttpContext.RequestServices.GetRequiredService<IJwtAuthManager>();
            IMasterServices _masterService = context.HttpContext.RequestServices.GetRequiredService<IMasterServices>();

            string token = context.HttpContext.Request.Headers[AUTHORIZATION];
            bool isValidToken = false;
            User user = null;
            string controllerName = (string)context.RouteData.Values["Controller"];
            string actionName = (string)context.RouteData.Values["Action"];
            if (!context.HttpContext.Request.Headers.TryGetValue(APIKEYNAME, out var extractedApiKey) && token == null)
            {
                context.Result = new UnauthorizedObjectResult("Unauthorized Access");
                _logger.WriteErrorLog(LogType.ERROR, "-------------------------------------------Unauthenticated  Access-------------------------------------------------");
                _logger.WriteErrorLog("Token is invalid");
                _logger.WriteErrorLog("Controller: " + controllerName);
                _logger.WriteErrorLog("Method: " + actionName);
                return;
            }

            if (token != null)
            {
                isValidToken = _jwtAuthManager.ValidateToken(token.Replace("Bearer ", ""));
            }

            if (!string.IsNullOrEmpty(extractedApiKey))
            {
                user = await _masterService.GetUserByAPIKey(extractedApiKey.ToString());
            }

            if (!isValidToken && user == null)
            {
                context.Result = new UnauthorizedObjectResult("Unauthorized Access");
                _logger.WriteErrorLog(LogType.ERROR, "-------------------------------------------Unauthenticated Access-------------------------------------------------");
                _logger.WriteErrorLog("Token is invalid");
                _logger.WriteErrorLog("Controller: " + controllerName);
                _logger.WriteErrorLog("Method: " + actionName);
                return;
            }

            //Check User API Access Enable or Disable
            if (!isValidToken && (user.ISAPIEnable == null || user.ISAPIEnable == false))
            {
                context.Result = new UnauthorizedObjectResult("Unauthorized Access");
                _logger.WriteErrorLog(LogType.ERROR, "-------------------------------------------Unauthenticated Access-------------------------------------------------");
                _logger.WriteErrorLog("APIKey is disable");
                _logger.WriteErrorLog("UserName: " + user.UserId);
                _logger.WriteErrorLog("Controller: " + controllerName);
                _logger.WriteErrorLog("Method: " + actionName);
                return;
            }
            _loggerInfo.WriteErrorLog(LogType.INFO,$"[{user?.UserId}] logged in the system.Controller: " + controllerName + ",Method: " + actionName);
            await next();
        }
    }
}