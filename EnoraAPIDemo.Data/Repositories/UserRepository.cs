using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Repositories;

namespace EnoraAPIDemo.Data.Repositories
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        private EnoraAPIDemoAPIContext _DbContext
        {
            get { return Context as EnoraAPIDemoAPIContext; }
        }

        public UserRepository(EnoraAPIDemoAPIContext context)
            : base(context)
        { }

        public async Task<IEnumerable<User>> GetAllWithUserAsync()
        {
            return await _DbContext.User.ToListAsync();
        }
        public async Task<User> GetUserByUserIdAsync(string userId)
        {
            return await _DbContext.User.Include(c => c.ClientAccount).Where(c=>c.IsDeleted == false && c.IsActive == true).SingleOrDefaultAsync(m => m.UserId == userId);
        }
        public async Task<User> GetUserByApiKeyAsync(string ApiKey)
        {
            return await _DbContext.User.Include(c => c.ClientAccount).SingleOrDefaultAsync(m => m.APIKey == ApiKey);
        }


        public async Task<User> GetClientAccountIdByUserIdAsync(string userId)
        {
            return await _DbContext.User.Include(c => c.ClientAccount).Where(c => c.IsDeleted == false && c.IsActive == true).SingleOrDefaultAsync(m => m.UserId == userId);
        }

        public async Task<User> GetWithUserByIdAsync(int id)
        {
            return await _DbContext.User.SingleOrDefaultAsync(m => m.Id == id);
        }

        public async Task<User> GetUserByIdAsync(int id)
        {
            return await _DbContext.User.Include(c => c.ClientAccount).Where(m => m.Id == id).FirstOrDefaultAsync();
        }
    }

}
