using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Repositories;

namespace EnoraAPIDemo.Data.Repositories
{
    public class RoleRepository : Repository<Role>, IRoleRepository
    {
        private EnoraAPIDemoAPIContext _DbContext
        {
            get { return Context as EnoraAPIDemoAPIContext; }
        }

        public RoleRepository(EnoraAPIDemoAPIContext context)
            : base(context)
        { }
    }
}
