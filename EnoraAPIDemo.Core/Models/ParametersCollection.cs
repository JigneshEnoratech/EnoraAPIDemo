using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.Models
{
    public class ParametersCollection
    {
        public string ParamterName { get; set; }
        public object ParamterValue { get; set; }
        public DbType ParamterType { get; set; }
        public ParameterDirection ParameterDirection { get; set; }
    }
}
