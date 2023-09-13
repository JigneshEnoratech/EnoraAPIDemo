using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class KeyValueModel
    {
        public string Name { get; set; }
        public int Value { get; set; }
    }

    public class KeyPairModel
    {
        public string Key { get; set; }
        public string Value { get; set; }
    }
}
