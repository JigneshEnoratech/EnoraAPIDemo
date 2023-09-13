using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Services;

namespace EnoraAPIDemo.Services
{
    public class ApplicationPermissionService : IApplicationPermissionService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRolePermissionService _rolePermissionService;

        public ApplicationPermissionService(IUnitOfWork unitOfWork, IRolePermissionService rolePermissionService)
        {
            this._unitOfWork = unitOfWork;
            _rolePermissionService = rolePermissionService;
        }

        public async Task<bool>  ClaimAction(string Controller, string ActionName, int RoleId)
        {
            bool IsValid = false;

            try
            {
                var appPermission = await _unitOfWork.ApplicationPermission.FirstOrDefaultAsync(c => c.ControllerName == Controller && c.ActionName == ActionName);
                if (appPermission != null)
                {

                    IsValid = await _rolePermissionService.GetPermission(RoleId, (int)appPermission.PermissionId);
                }

            }
            catch (Exception)
            {
                //_logger.WriteErrorLog("-----------------------------ApplicationPermission Services------------------------------------------- ");
                //_logger.WriteErrorLog("ClaimAction: " + ex.StackTrace.ToString());
                //_logger.WriteErrorLog("ClaimAction: " + ex.Message.ToString());
                //_logger.WriteErrorLog("-----------------------------ApplicationPermission Services------------------------------------------- ");
            }

            return IsValid;
        }
    }
}
