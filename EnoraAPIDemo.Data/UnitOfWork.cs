using System.Threading.Tasks;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Repositories;
using EnoraAPIDemo.Data.Repositories;

namespace EnoraAPIDemo.Data
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly EnoraAPIDemoAPIContext _context;
        private UserRepository _userRepository;
        private PermissionRepository _permissionRepository;
        private RoleRepository _roleRepository;
        private ItemMasterRepository _itemMasterRepository;
        private RolePermissionRepository _rolePermissionRepository;
        private ApplicationPermissionRepository _applicationPermissionRepository;
        
        public UnitOfWork(EnoraAPIDemoAPIContext context)
        {
            this._context = context;
        }

        public IUserRepository Users => _userRepository = _userRepository ?? new UserRepository(_context);
        public IPermissionRepository Permission => _permissionRepository = _permissionRepository ?? new PermissionRepository(_context);
        public IRoleRepository Role => _roleRepository = _roleRepository ?? new RoleRepository(_context);
        public IItemMasterRepository ItemMaster => _itemMasterRepository = _itemMasterRepository ?? new ItemMasterRepository(_context);
        public IRolePermissionRepository RolePermission => _rolePermissionRepository = _rolePermissionRepository ?? new RolePermissionRepository(_context);
        public IApplicationPermissionRepository ApplicationPermission => _applicationPermissionRepository = _applicationPermissionRepository ?? new ApplicationPermissionRepository(_context);
       


   
        public async Task<int> CommitAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public int Commit()
        {
            return _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
