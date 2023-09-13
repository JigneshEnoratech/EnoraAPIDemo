using System;
using System.Collections.Generic;

namespace EnoraAPIDemo.Core.Models
{
    public partial class AccountLicense
    {
        public int Id { get; set; }
        public int? ClientAccountId { get; set; }
        public DateTime? ActivationDate { get; set; }
        public int? Day { get; set; }
        public int? Week { get; set; }
        public int? Month { get; set; }
        public int? Year { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public string EmailSchema { get; set; }
        public int? NoOfDay { get; set; }
        public int? NoOfEntity { get; set; }
        public int? NoOfUser { get; set; }
        public bool? IsEnable { get; set; }
        public bool? IsExpire { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
