using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.Services
{
    public interface IApplicationPermissionService
    {
        Task<bool> ClaimAction(string Controller, string ActionName, int RoleId);

    }
}
