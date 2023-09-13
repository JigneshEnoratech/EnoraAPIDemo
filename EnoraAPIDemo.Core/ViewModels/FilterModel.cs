using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class ResultFilter
    {
        public ResultFilter()
        {
            Page = new Page
            {
                pageSize = 10,
                startIndex = 0
            };
        }

        public Page Page { get; set; }
        public List<string> resultData { get; set; }
    }
    public class Page
    {
        public int startIndex { get; set; }
        public int pageSize { get; set; }
        public int totalPage { get; set; }
    }
}
