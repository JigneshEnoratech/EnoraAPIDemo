using System;
using System.Collections.Generic;

namespace EnoraAPIDemo.Core.Models
{
    public partial class Role
    {
        public Role()
        {
            RolePermission = new HashSet<RolePermission>();
        }

        public int Id { get; set; }
        public string RoleName { get; set; }
        public bool IsDeleted { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public bool IsActive { get; set; }

        public virtual ICollection<RolePermission> RolePermission { get; set; }
    }
}
