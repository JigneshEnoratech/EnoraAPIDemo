using Microsoft.EntityFrameworkCore;
using EnoraAPIDemo.Core.Models;

namespace EnoraAPIDemo.Data
{
    public partial class EnoraAPIDemoAPIContext : DbContext
    {
        public EnoraAPIDemoAPIContext(DbContextOptions<EnoraAPIDemoAPIContext> options)
      : base(options)
        {
        }

        public virtual DbSet<AccountLicense> AccountLicense { get; set; }
        public virtual DbSet<AccountType> AccountType { get; set; }
        public virtual DbSet<ApplicationPermission> ApplicationPermission { get; set; }
        public virtual DbSet<ClientAccount> ClientAccount { get; set; }
        public virtual DbSet<Permission> Permission { get; set; }
       
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<RolePermission> RolePermission { get; set; }
        public virtual DbSet<StartupConfig> StartupConfig { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<ItemMaster> ItemMaster { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.ApplyConfigurationsFromAssembly.Add(new ResultDNSPermutationsMap());
            //modelBuilder.ApplyConfigurationsFromAssembly.Add(new ResultNegativeNewsMap());
            //modelBuilder.ApplyConfigurationsFromAssembly.Add(new ResultGeneralNewsMap());

            modelBuilder.Entity<AccountLicense>(entity =>
            {
                entity.Property(e => e.ActivationDate).HasColumnType("datetime");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmailSchema).HasMaxLength(200);

                entity.Property(e => e.ExpiryDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<AccountType>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AccountTypeDescription).HasMaxLength(500);

                entity.Property(e => e.AccountTypeName).HasMaxLength(100);
            });

            modelBuilder.Entity<ApplicationPermission>(entity =>
            {
                entity.Property(e => e.ActionName).HasMaxLength(50);

                entity.Property(e => e.ControllerName).HasMaxLength(50);

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.ApplicationPermission)
                    .HasForeignKey(d => d.PermissionId)
                    .HasConstraintName("FK_ApplicationPermission_Permission");
            });

           

            modelBuilder.Entity<ClientAccount>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CompanyDescription).HasMaxLength(500);

                entity.Property(e => e.CompanyName).HasMaxLength(100);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.AccountType)
                    .WithMany(p => p.ClientAccount)
                    .HasForeignKey(d => d.AccountTypeId)
                    .HasConstraintName("FK_AccountMaster_AccountType");
            });

            

           

            


           

            
           

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.PermissionName).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

           

          

          

          

           

           

           

            

          
           

           

           
           

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.RoleName).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<RolePermission>(entity =>
            {
                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.RolePermission)
                    .HasForeignKey(d => d.PermissionId)
                    .HasConstraintName("FK_RolePermission_Permission");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.RolePermission)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_RolePermission_Role");
            });

           

           
           

          

            modelBuilder.Entity<StartupConfig>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");
            });

           

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Edate)
                    .HasColumnName("EDate")
                    .HasColumnType("datetime");

                entity.Property(e => e.FirstName).HasMaxLength(100);

                entity.Property(e => e.LastName).HasMaxLength(100);

                entity.Property(e => e.Password)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.ProfilePhoto).IsUnicode(false);

                entity.Property(e => e.Token).HasMaxLength(500);

                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.ClientAccount)
                 .WithMany(p => p.Users)
                 .HasForeignKey(d => d.ClientAccountId)
                 .OnDelete(DeleteBehavior.ClientSetNull)
                 .HasConstraintName("FK_dbo.User_dbo.ClientAccount_ClientAccountId");
                entity.Property(e => e.IsTNCApproved).HasColumnName("IsTNCApproved");

            });

           

           
           

            

           

            

           
            

           

            

           
            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }

}
