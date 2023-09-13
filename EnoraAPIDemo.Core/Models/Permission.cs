using System;
using System.Collections.Generic;

namespace EnoraAPIDemo.Core.Models
{
    public partial class Permission
    {
        public Permission()
        {
            ApplicationPermission = new HashSet<ApplicationPermission>();
            RolePermission = new HashSet<RolePermission>();
        }

        public int Id { get; set; }
        public string PermissionName { get; set; }
        public bool IsDeleted { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public bool IsActive { get; set; }

        public virtual ICollection<ApplicationPermission> ApplicationPermission { get; set; }
        public virtual ICollection<RolePermission> RolePermission { get; set; }
    }
}
