using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;

namespace EnoraAPIDemo.Core.Services
{
    public interface IUserService
    {
        Task<User> GetUserById(int id);
        Task<User> GetUserByUserId(int userId);
        Task<User> CreateUser(User newUser);
        Task UpdateUser(User UserToBeUpdated, User User);
        Task DeleteUser(User User);
        Task<AuthenticateReturn> IsAuthenticated(LoginRequest model);
        Task<AuthenticateReturn> IsAuthenticated(ApiRequest model);
        Task<int> GetUserRole(string userName);
        Task<int> GetClientAccountId(string userName);
    }
}
