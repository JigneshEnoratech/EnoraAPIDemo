using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Utility
{
    public class Logger : ILogger
    {
        #region Private Objects
        private readonly string _directoryPath;
        private readonly string _logFilePath;
        private static object locker = new Object();
        #endregion

        #region Constructor
        public Logger(string directoryPath)
        {
            _directoryPath = directoryPath;
            _logFilePath = _directoryPath + LOGConstants.LOG_FILE_NAME;
            CheckFileSize();
        }

        public Logger(string directoryPath, string fileName)
        {
            _directoryPath = directoryPath;
            _logFilePath = _directoryPath + fileName;
            CheckFileSize();
        }
        #endregion

        #region Public Methods
        public void WriteErrorLog(Exception ex)
        {
            WriteLogToFile($"{DateTime.Now.ToString("dd-MMM-yy hh:mm:ss.fff tt")} - Source: {ex.Source.ToString().Trim()} Message: {ex.Message.ToString().Trim()}");
        }

        public void WriteErrorLog(string Message)
        {
            WriteLogToFile($"{DateTime.Now.ToString("dd-MMM-yy hh:mm:ss.fff tt")} - Message: {Message}");
        }

        public void WriteErrorLog(LogType flag, string Message)
        {
            WriteLogToFile($"{DateTime.Now.ToString("dd-MMM-yy hh:mm:ss.fff tt")} - {flag.ToString()} - Message: {Message}");
        }

        public void WriteErrorLog(LogType flag, Exception ex)
        {
            WriteLogToFile($"{DateTime.Now.ToString("dd-MMM-yy hh:mm:ss.fff tt")} - {flag.ToString()} - Source: {ex.Source.ToString().Trim()} Message: {ex.Message.ToString().Trim()}");
        }
        #endregion

        #region Private Methods
        private void WriteLogToFile(string log)
        {
            try
            {
                lock (locker)
                {
                    FileInfo fi = new FileInfo(_logFilePath);

                    if (log.Length > LOGConstants.LogSize)
                    {
                        do
                        {
                            var split = log.Substring(0, LOGConstants.LogSize);
                            log = log.Substring(LOGConstants.LogSize);
                            WriteInTxt(split);
                            Compress(GetDirectoryPath() + GetNewFileName(), _logFilePath);
                            File.WriteAllText(_logFilePath, String.Empty);
                            fi = new FileInfo(_logFilePath);
                        } while (log.Length > LOGConstants.LogSize);
                    }
                    else if (fi != null && fi.Exists && fi.Length > LOGConstants.LogSize)
                    {
                        Compress(GetDirectoryPath() + GetNewFileName(), _logFilePath);
                        File.WriteAllText(_logFilePath, String.Empty);
                    }
                    else if (fi != null && fi.Exists && fi.Length + log.Length > LOGConstants.LogSize)
                    {
                        do
                        {
                            var len = LOGConstants.LogSize - Convert.ToInt32(fi.Length);
                            var split = log.Substring(0, len);
                            log = log.Substring(len);
                            WriteInTxt(split);
                            Compress(GetDirectoryPath() + GetNewFileName(), _logFilePath);
                            File.WriteAllText(_logFilePath, String.Empty);
                            fi = new FileInfo(_logFilePath);
                        } while (fi.Length + log.Length > LOGConstants.LogSize);
                    }
                    WriteInTxt(log);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void WriteInTxt(string log)
        {
            using (FileStream file = new FileStream(_logFilePath, FileMode.Append, FileAccess.Write, FileShare.Read))
            using (StreamWriter writer = new StreamWriter(file, Encoding.Unicode))
            {
                writer.WriteLine(log);
            }
        }

        private string GetDirectoryPath()
        {
            var directoryname = _directoryPath + "\\LogBackUp\\";

            if (!Directory.Exists(directoryname))
                Directory.CreateDirectory(directoryname);

            return directoryname;
        }

        private string GetNewFileName()
        {
            string fileNameWithoutExtention = Path.GetFileNameWithoutExtension(_logFilePath);
            return fileNameWithoutExtention + "_" +
                                       DateTime.Now.Month.ToString() + "_" + DateTime.Now.Date.Day.ToString() + "_" +
                                       DateTime.Now.Year.ToString() + "_" + DateTime.Now.Hour.ToString() + "_" +
                                       DateTime.Now.Minute.ToString() + "_" + DateTime.Now.Second.ToString();
        }

        private void CheckFileSize()
        {
            try
            {
                FileInfo fi = new FileInfo(_logFilePath);
                if (!fi.Exists)
                    return;

                if (fi.Length >= LOGConstants.LogSize)
                {
                    Compress(GetDirectoryPath() + GetNewFileName(), _logFilePath);
                    File.WriteAllText(_logFilePath, String.Empty);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void Compress(string _outputFile, string _logFile)
        {
            try
            {
                FileInfo fi = new FileInfo(_logFile);

                if (!fi.Exists)
                    return;

                // Get the stream of the source file.
                using (FileStream inFile = fi.OpenRead())
                {
                    // Prevent compressing hidden and 
                    // already compressed files.
                    if ((File.GetAttributes(fi.FullName)
                        & FileAttributes.Hidden)
                        != FileAttributes.Hidden & fi.Extension != ".gz")
                    {
                        // Create the compressed file.
                        using (FileStream outFile = File.Create(_outputFile + ".gz"))
                        {
                            using (GZipStream Compress =
                                new GZipStream(outFile,
                                CompressionMode.Compress))
                            {
                                // Copy the source file into 
                                // the compression stream.
                                inFile.CopyTo(Compress);

                                Console.WriteLine("Compressed {0} from {1} to {2} bytes.",
                                    fi.Name, fi.Length.ToString(), outFile.Length.ToString());
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion
    }
}
