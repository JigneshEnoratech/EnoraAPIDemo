using System.Collections.Generic;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class ApplicationPermissionModel
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public int? PermissionId { get; set; }

        public PermissionModel Permission { get; set; }

    }

    public class MenubarModel
    {
        public bool Dashboard { get; set; }
        public bool Guide { get; set; }
        public bool MyCompany { get; set; }
        public bool DarCache { get; set; }
        public bool RSSFeed { get; set; }
        public bool ManageAsset { get; set; }
        public bool AddAsset { get; set; }
        public bool ManagePolicy { get; set; }
        public bool AddPolicy { get; set; }
        public bool ManageJob { get; set; }
        public bool AddJob { get; set; }
        public bool UserList { get; set; }
        public bool AddUser { get; set; }
        public bool AccounterList { get; set; }
        public bool AddAccount { get; set; }
        public bool ScanResult { get; set; }
        public bool Wordlist { get; set; }
        public bool Glossary { get; set; }
        public bool ViewLicense { get; set; }
        public bool Scanner { get; set; }
        public bool SMTPConfig { get; set; }

    }

    public class SubmitPermissionModel
    {
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public bool isPermission { get; set; }
        public string MethodName { get; set; }
        public string ButtonID { get; set; }
        public string ButtonType { get; set; }
        public string ButtonText { get; set; }
        public string ClassNames { get; set; }
        public string ButtonStyle { get; set; }

    }
}
