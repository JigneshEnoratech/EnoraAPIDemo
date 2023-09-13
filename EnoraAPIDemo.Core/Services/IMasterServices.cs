using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.Models;


namespace EnoraAPIDemo.Core.Services
{
    public interface IMasterServices
    {
        Task<bool> ClaimAction(string Controller, string ActionName, int RoleId);
        Task<User> GetUserByAPIKey(string APIKey);
    }
}
