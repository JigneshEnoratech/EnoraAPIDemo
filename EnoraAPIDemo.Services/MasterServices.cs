using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Services;

namespace EnoraAPIDemo.Services
{
    public class MasterServices : IMasterServices
    {
        #region Private Objects
        private string _directoryPath;
        //private readonly ILogger _logger;
        //private readonly IRoleService _roleService;
        //private readonly IRolePermissionService _rolePermissionService;
        private readonly IApplicationPermissionService _applicationPermissionService;
        private readonly IUserService _userService;
        private readonly IUnitOfWork _unitOfWork;

        #endregion

        #region Constructor
        public MasterServices(IApplicationPermissionService applicationPermissionService, IUserService userService, IUnitOfWork unitOfWork)
        {
            _directoryPath = AppDomain.CurrentDomain.BaseDirectory;
            _applicationPermissionService = applicationPermissionService;
            _userService = userService;
            _unitOfWork = unitOfWork;
        }
        #endregion

        public async Task<bool> ClaimAction(string Controller, string ActionName, int RoleId)
        {
            try
            {
                return await _applicationPermissionService.ClaimAction(Controller, ActionName, RoleId);
            }
            catch (Exception)
            {
                //_logger.WriteErrorLog("-----------------------------Master Services------------------------------------------- ");
                //_logger.WriteErrorLog("ClaimAction: " + ex.StackTrace.ToString());
                //_logger.WriteErrorLog("ClaimAction: " + ex.Message.ToString());
                //_logger.WriteErrorLog("-----------------------------Master Services------------------------------------------- ");
            }

            return await new Task<bool>(() => false);
        }

        public async Task<User> GetUserByAPIKey(string APIKey)
        {
            Task<User> userNull = new Task<User>(() => null);
            try
            {
                var user = await _unitOfWork.Users.GetUserByApiKeyAsync(APIKey);
                if (user != null)
                {
                    if (user.ClientAccount.IsAccountActive)
                    {
                        if (user.IsAccountActive)
                        {
                            return user;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //_logger.WriteErrorLog("-----------------------------Master Services------------------------------------------- ");
                //_logger.WriteErrorLog("ClaimAction: " + ex.StackTrace.ToString());
                //_logger.WriteErrorLog("ClaimAction: " + ex.Message.ToString());
                //_logger.WriteErrorLog("-----------------------------Master Services------------------------------------------- ");
            }

            return null;
        }
    }
}