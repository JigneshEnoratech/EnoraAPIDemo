using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Repositories;

namespace EnoraAPIDemo.Data.Repositories;

public class PermissionRepository : Repository<Permission>, IPermissionRepository
{
    private EnoraAPIDemoAPIContext _DbContext
    {
        get { return Context as EnoraAPIDemoAPIContext; }
    }

    public PermissionRepository(EnoraAPIDemoAPIContext context)
        : base(context)
    { }
}
