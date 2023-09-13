using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class PermissionModel
    {
        public int Id { get; set; }
        public string PermissionName { get; set; }
        public int CreatedBy { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreatedOn { get; set; }

        public int? UpdatedBy { get; set; }

        public DateTime? UpdatedOn { get; set; }

        public bool IsDeleted { get; set; }

        public bool IsActive { get; set; }

        public List<RolePermissionModel> RolePermission { get; set; }

    }
}
