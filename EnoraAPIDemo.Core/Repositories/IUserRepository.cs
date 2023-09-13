using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;

namespace EnoraAPIDemo.Core.Repositories
{
    public interface IUserRepository : IRepository<User>
    {
        Task<User> GetUserByUserIdAsync(string userId);
        Task<IEnumerable<User>> GetAllWithUserAsync();
        Task<User> GetWithUserByIdAsync(int id);
        Task<User> GetUserByIdAsync(int id);
        Task<User> GetClientAccountIdByUserIdAsync(string userId);
        Task<User> GetUserByApiKeyAsync(string ApiKey);
    }
}
