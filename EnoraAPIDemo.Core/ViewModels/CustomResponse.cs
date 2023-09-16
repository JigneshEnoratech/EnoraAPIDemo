using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class CustomResponse<T>
    {
        public string Message { get; set; }
        public bool Status { get; set; }
        public T data { get; set; }
    }
}
