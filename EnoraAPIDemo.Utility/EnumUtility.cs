using System;
using System.ComponentModel;

namespace EnoraAPIDemo.Utility
{
    public static class EnumExtensions
    {
        public static string Description(this Enum enumValue)
        {
            var enumType = enumValue.GetType();
            var field = enumType.GetField(enumValue.ToString());
            var attributes = field.GetCustomAttributes(typeof(DescriptionAttribute), false);
            return attributes.Length == 0
                ? enumValue.ToString()
                : ((DescriptionAttribute)attributes[0]).Description;
        }

    }

    public class EnumUtility<T> where T : struct
    {
        public static string GetDescriptionByKey(int key)
        {
            Enum e = (Enum)Enum.ToObject(typeof(T), key);
            return e.Description();
        }
    }

    public enum PolicyTypeEnum
    {
        EnoraAPIDemo = 1,
        Company = 2
    }

    
    public enum LogType
    {
        CUSTOM,
        INFO,
        WARNING,
        ERROR,

    }
    public class LOGConstants
    {

        public static string LOG_APP_DIR = AppDomain.CurrentDomain.BaseDirectory;
        public const string LOG_FILE_NAME = "LogFile.txt";
        public const string BADREQUESTLOG_FILE_NAME = "BadRequestLog.Log";
        public const string UNAUTHORIZED_FILE_NAME = "UnauthorizedLog.Log";
        public const string AUTHORIZATION_FILE_NAME = "AuthorizationLog.Log";
        public const int LogSize = 10485760;
    }

   
   
}
