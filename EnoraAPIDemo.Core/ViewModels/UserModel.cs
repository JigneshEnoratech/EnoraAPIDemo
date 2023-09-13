using System;
using System.ComponentModel.DataAnnotations;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class UserModel 
    {
        public int ClientAccountId { get; set; }

        [Required(ErrorMessage = "Please enter user email")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [Display(Name = "User Email")]
        public string UserId { get; set; }

        [Required]
        public string Password { get; set; }

        public bool IsRemember { get; set; }

        [Display(Name ="Role")]
        public int RoleId { get; set; }
        public string Token { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ProfilePhoto { get; set; }

        public DateTime? EDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public bool IsDeleted { get; set; }
        public bool? IsOwner { get; set; }
        public bool IsAccountActive { get; set; }
        
        public string returnUrl { get; set; }
        public ClientAccountModel ClientAccount { get; set; }
        public RoleModel Role { get; set; }
    }

    public class ResetPasswordModel
    {
        public string UserId { get; set; }
         
        [Required(ErrorMessage = "New password required", AllowEmptyStrings = false)]
        [DataType(DataType.Password)]
        [Display(Name = "New Password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password")]
        [Compare("NewPassword", ErrorMessage = "New password and confirm password do not match")]
        public string ConfirmPassword { get; set; }
    }

    public class ChangePasswordModel : ResetPasswordModel
    {
        [Required(ErrorMessage = "Old password required", AllowEmptyStrings = false)]
        [DataType(DataType.Password)]
        [Display(Name = "Old Password")]
        public string OldPassword { get; set; }
    }

    public class CreatePasswordModel
    {

        public string UserId { get; set; }
        [RegularExpression(@"^.{8,}$", ErrorMessage = "The Password must be at least 8 characters long.")]
        [Required(ErrorMessage = "Password required", AllowEmptyStrings = false)]
        [StringLength(20,ErrorMessage = "Password can contain maximum 20 characters.")]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password")]
        [Compare("Password", ErrorMessage = "New password and confirm password do not match")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "First name required.")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last name required.")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        public string ProfilePhoto { get; set; }
        public string Token { get; set; }

    }

    public class UserGridModel 
    {
        public string encodedID { get; set; }        
        public string UserId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public bool? IsOwner { get; set; }
        public bool IsActive { get; set; }
        public bool IsAccountActive { get; set; }
        public string RoleName { get; set; }
        public int RoleId { get; set; }
    }
}
