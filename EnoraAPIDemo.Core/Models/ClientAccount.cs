using System;
using System.Collections.Generic;

namespace EnoraAPIDemo.Core.Models
{
    public partial class ClientAccount
    {
        public int Id { get; set; }
        public string CompanyName { get; set; }
        public string CompanyDescription { get; set; }
        public int? AccountTypeId { get; set; }
        public bool IsDeleted { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public bool IsActive { get; set; }
        public bool IsAccountActive { get; set; }

        public virtual AccountType AccountType { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
