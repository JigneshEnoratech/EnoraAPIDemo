namespace EnoraAPIDemo.Core.ViewModels
{
    public class RolePermissionModel
    {
        public long Id { get; set; }
        public int? RoleId { get; set; }
        public int? PermissionId { get; set; }
        public bool? IsPermission { get; set; }

        public RoleModel RoleModel { get; set; }
        public PermissionModel Permission { get; set; }

    }
}