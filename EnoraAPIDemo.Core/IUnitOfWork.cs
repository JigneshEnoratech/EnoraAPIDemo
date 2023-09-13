using System;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Repositories;

namespace EnoraAPIDemo.Core
{
    public interface IUnitOfWork : IDisposable
    {
        IUserRepository Users { get; }
        IPermissionRepository Permission { get; }
        IRoleRepository Role { get; }
        IItemMasterRepository ItemMaster { get; }
        IRolePermissionRepository RolePermission { get; }
        IApplicationPermissionRepository ApplicationPermission { get; }

        

       
       
        Task<int> CommitAsync();
        int Commit();
    }
}