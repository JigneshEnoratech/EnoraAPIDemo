using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Api.Resources
{
    public class ItemResource
    {
        public int ID { get; set; }
        public string ItemName { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public int CreatedBy { get; set; }
    }
    
}
