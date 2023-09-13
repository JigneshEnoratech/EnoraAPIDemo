using System;
using System.ComponentModel.DataAnnotations;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class AccountLicenseModel 
    {
        public int Id { get; set; }
        public int ClientAccountId { get; set; }
        [Display(Name = "Activation Date")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Please enter activation date.", AllowEmptyStrings = false)]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? ActivationDate { get; set; }
        [Display(Name = "Day:")]
        public int? Day { get; set; }
        [Display(Name = "Week:")]
        public int? Week { get; set; }
        [Display(Name = "Month:")]
        public int? Month { get; set; }
        [Display(Name = "Year:")]
        public int? Year { get; set; }
        [Display(Name = "Expiry Date:")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Please enter expiry date.", AllowEmptyStrings = false)]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? ExpiryDate { get; set; }
        [Display(Name = "Email Schema")]
        [Required(ErrorMessage = "Please enter email schema.", AllowEmptyStrings = false)]
        public string EmailSchema { get; set; }
        [Display(Name = "Number of day:")]
        public int? NoOfDay { get; set; }
        [Required(ErrorMessage = "Please enter entity.", AllowEmptyStrings = false)]
        [Display(Name = "Number of Entity")]
        public int? NoOfEntity { get; set; }
        public int? NoOfUser { get; set; }
        public bool? IsEnable { get; set; }
        public bool? IsExpire { get; set; }
        public virtual int CreatedBy { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MMM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? CreatedDate { get; set; }
        public UserModel UserCreatedBy { get; set; }
    }
}