using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Repositories;

namespace EnoraAPIDemo.Data.Repositories
{
    public class ApplicationPermissionRepository : Repository<ApplicationPermission>, IApplicationPermissionRepository
    {
        private EnoraAPIDemoAPIContext _DbContext
        {
            get { return Context as EnoraAPIDemoAPIContext; }
        }

        public ApplicationPermissionRepository(EnoraAPIDemoAPIContext context)
            : base(context)
        { }
    }
}
