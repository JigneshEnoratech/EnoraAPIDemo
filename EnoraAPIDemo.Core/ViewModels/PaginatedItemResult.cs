using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class PaginatedItemResult
    {
        public Page Page { get; set; }
        public List<ItemMasterModel> Data { get; set; }
    }
}
