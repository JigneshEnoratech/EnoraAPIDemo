using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class RoleModel
    {
        public int Id { get; set; }
        public string RoleName { get; set; }

        public int CreatedBy { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreatedOn { get; set; }

        public int? UpdatedBy { get; set; }

        public DateTime? UpdatedOn { get; set; }

        public bool IsDeleted { get; set; }

        public bool IsActive { get; set; }
        public List<UserModel> Users { get; set; }

        public List<RolePermissionModel> RolePermission { get; set; }
    }


    public class RoleViewModel
    {
        public RoleModel RoleModel { get; set; }
        public List<RoleModel> RoleModelList { get; set; }
    }
    
}