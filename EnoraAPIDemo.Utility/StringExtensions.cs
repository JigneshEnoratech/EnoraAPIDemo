using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Utility
{
    public static class StringExtensions
    {
        public static string Encode(this string encodeMe)
        {
            var eid = encodeMe.Encrypt();
            byte[] encoded = System.Text.Encoding.UTF8.GetBytes(eid);
            return Convert.ToBase64String(encoded);
        }
        public static string Decode(this string decodeMe)
        {
            byte[] encoded = Convert.FromBase64String(decodeMe);
            var descodeString = System.Text.Encoding.UTF8.GetString(encoded);
            var did = descodeString.Decrypt();
            return did;
        }

        public static string Encrypt(this string str)
        {
            return AES.Encrypt(str, Constants.AES_KEY);
        }

        public static string Decrypt(this string str)
        {
            return AES.Decrypt(str, Constants.AES_KEY);
        }
        public static bool IsValidDomainName(this string name)
        {
            // Regex to check valid domain name.
            //Match match = Regex.Match(name, @"(http[s]?:\/\/|[a-z]*\.[a-z]{3}\.[a-z]{2})([a-z]*\.[a-z]{3})|([a-z]*\.[a-z]*\.[a-z]{3}\.[a-z]{2})|([a-z]+\.[a-z]{3})");
            Match match = Regex.Match(name, @"^(http|https|ftp|)\://|[a-zA-Z0-9\-\.]+\.[a-zA-Z](:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*[^\.\,\)\(\s]$");

            //Return true if the domain name
            // matched the ReGex
            if (match.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool IsValidJson(string data)
        {
            data = data.Trim();
            try
            {
                JsonConvert.DeserializeObject(data);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
