using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Api.Resources
{
    public class UserResource
    {
        public int Id { get; set; }
        public int ClientAccountId { get; set; }
        public string UserId { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ProfilePhoto { get; set; }
        public int RoleId { get; set; }
    }
}
