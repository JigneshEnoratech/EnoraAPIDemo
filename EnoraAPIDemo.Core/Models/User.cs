using System;
using System.Collections.Generic;

namespace EnoraAPIDemo.Core.Models
{
    public partial class User
    {
        

        public int Id { get; set; }
        public int ClientAccountId { get; set; }
        public string UserId { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ProfilePhoto { get; set; }
        public int RoleId { get; set; }
        public string Token { get; set; }
        public DateTime? Edate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public bool IsAccountActive { get; set; }
        public bool? IsOwner { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsActive { get; set; }
        public string APIKey { get; set; }
        public bool? ISAPIEnable { get; set; }
        public bool? IsTNCApproved { get; set; }

        public virtual ClientAccount ClientAccount { get; set; }




    }
}
