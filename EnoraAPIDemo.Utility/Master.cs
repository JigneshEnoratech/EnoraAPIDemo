using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.ViewModels;

namespace EnoraAPIDemo.Utility
{
    public class Master
    {
        private static string _directoryPath ;
        private static readonly ILogger _logger;
         static Master()
        {
            _directoryPath = AppDomain.CurrentDomain.BaseDirectory;
            _logger = new Logger(_directoryPath, "BadRequestLog.Log");
        }
        public static ErrorModel FormatOutput(dynamic modelState, string ControllerName, string ActionName)
        {
            ErrorModel baseResult = new ErrorModel();
            baseResult.Message = "API Request not compliant,Please check your request body parameter.";
            baseResult.TimeStamp = DateTime.Now;

            foreach (var state in modelState)
            {
                string errorKey = state.Key;
                errorKey = errorKey?.Replace("$.", "");
                foreach (var error in state.Value.Errors)
                {
                    baseResult.Errors.Add(AddCustomeMessage(ControllerName, ActionName, errorKey.ToLower()).ToString());
                }
            }
            string errorsString = string.Join(",", baseResult.Errors.ToArray());
            _logger.WriteErrorLog(LogType.ERROR, "-------------------------------------------Bad Request-------------------------------------------------");
            _logger.WriteErrorLog("Controller: " + ControllerName);
            _logger.WriteErrorLog("Method: " + ActionName);
            _logger.WriteErrorLog(errorsString.ToString());
            return baseResult;
        }

        private static string AddCustomeMessage(string ControllerName, string ActionName, string Key)
        {

            switch (ControllerName)
            {
                case "ScanResults":
                    switch (ActionName)
                    {
                        case "GetScanResult":
                            switch (Key)
                            {
                                case "job":
                                    return Validation.GETSCANRESULT_JOB;
                               
                                default:
                                    break;
                            }
                            break;
                        
                        default:
                            break;
                    }
                    break;
                default:
                    break;
            }
            return "";
        }

    }
}
