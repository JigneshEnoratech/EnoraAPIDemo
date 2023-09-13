﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.Services
{
    public interface IRolePermissionService
    {
        Task<bool> GetPermission(int RoleId, int PermissionId);
    }
}
