using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Repositories;

namespace EnoraAPIDemo.Data.Repositories
{
    public class RolePermissionRepository : Repository<RolePermission>, IRolePermissionRepository
    {
        private EnoraAPIDemoAPIContext _DbContext
        {
            get { return Context as EnoraAPIDemoAPIContext; }
        }

        public RolePermissionRepository(EnoraAPIDemoAPIContext context)
            : base(context)
        { }
    }
}
