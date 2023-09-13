using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class ClientAccountModel
    {
        [Required(ErrorMessage = "Please enter Company Name", AllowEmptyStrings =false)]
        [Display(Name = "Company Name")]
        public string CompanyName { get; set; }

        [Required(ErrorMessage = "Please enter Company Description",AllowEmptyStrings =false)]
        [Display(Name = "Description")]
        public string CompanyDescription { get; set; }
        public int? AccountTypeId { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsOwnerActive { get; set; }
        public bool IsAccountActive { get; set; }
        public bool LicenseHolder { get; set; }
        public bool ExpiredLicense { get; set; }

        public List<UserModel> Users { get; set; }
    }

    public class AddClientAccountModel
    {
        public ClientAccountModel clientAccountModel {get;set;}
        public AccountLicenseModel AccountLicenseModel { get; set; }
        public UserModel userModel { get; set; }
    }

    public class AddUserModel
    {
        [Required(ErrorMessage = "Please enter user email")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [Display(Name = "User Email")]
        public string UserId { get; set; }
        public int ClientAccountId { get; set; }

        [Display(Name ="Role")]
        [Required(ErrorMessage = "Please select role")]
        public int RoleId { get; set; }

    }

    public class AccountGridModel
    {
        public string CompanyName { get; set; }
        public string CompanyDescription { get; set; }
        public int? AccountTypeId { get; set; }        
        public string  ActivationDate { get; set; }
        public string ExpiryDate { get; set; }
        public int? NoOfEntity { get; set; }
        public bool IsAccountActive { get; set; }
        public bool IsOwnerActive { get; set; }
        public bool ExpiredLicense { get; set; }
        public string Primary_Contact { get; set; }
        public string encodedID { get; set; }
    }
}
