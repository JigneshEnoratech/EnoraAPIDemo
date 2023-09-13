using System;
using System.ComponentModel.DataAnnotations;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class TermsAndConditionModel
    {
        public int Id { get; set; }
        public int? Version { get; set; }
        public string TermsAndConditionHTML { get; set; }
        public bool? IsActive { get; set; }
    }
}