using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Utility
{
    public interface ILogger
    {
        void WriteErrorLog(Exception ex);
        void WriteErrorLog(string Message);
        void WriteErrorLog(LogType flag, Exception ex);
        void WriteErrorLog(LogType flag, string Message);
    }
}
