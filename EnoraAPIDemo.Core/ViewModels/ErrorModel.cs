using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class ErrorModel
    {
        public ErrorModel()
        {
            Errors = new List<string>();
        }
        public string Message { get; set; }

        public List<string> Errors { get; set; }
        public DateTime TimeStamp { get; set; }
    }
}
