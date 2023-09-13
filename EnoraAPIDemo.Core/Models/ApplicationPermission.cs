using System;
using System.Collections.Generic;

namespace EnoraAPIDemo.Core.Models
{
    public partial class ApplicationPermission
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public int? PermissionId { get; set; }

        public virtual Permission Permission { get; set; }
    }
}
