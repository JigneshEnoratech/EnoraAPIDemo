using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Services;

namespace EnoraAPIDemo.Services
{
    public class RolePermissionService : IRolePermissionService
    {
        private readonly IUnitOfWork _unitOfWork;
        public RolePermissionService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<bool> GetPermission(int RoleId, int PermissionId)
        {
            bool IsPermission = false;

            try
            {
                var rolePermission = await _unitOfWork.RolePermission.FirstOrDefaultAsync(c => c.RoleId == RoleId && c.PermissionId == PermissionId);
                if (rolePermission != null)
                {
                    IsPermission = (bool)rolePermission.IsPermission;
                }
            }
            catch (Exception)
            {
                //_logger.WriteErrorLog("-----------------------------RolePermission Services------------------------------------------- ");
                //_logger.WriteErrorLog("GetPermission: " + ex.StackTrace.ToString());
                //_logger.WriteErrorLog("GetPermission: " + ex.Message.ToString());
                //_logger.WriteErrorLog("-----------------------------RolePermission Services------------------------------------------- ");
            }

            return IsPermission;
        }
    }
}
