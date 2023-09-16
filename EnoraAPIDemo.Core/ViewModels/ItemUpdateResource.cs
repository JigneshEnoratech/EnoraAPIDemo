﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class ItemUpdateResource
    {
        public int ID { get; set; }
        public string ItemName { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
       
    }
}
