using System;
using System.Collections.Generic;

namespace EnoraAPIDemo.Core.Models
{
    public partial class AccountType
    {
        public AccountType()
        {
            ClientAccount = new HashSet<ClientAccount>();
        }

        public int Id { get; set; }
        public string AccountTypeName { get; set; }
        public string AccountTypeDescription { get; set; }

        public virtual ICollection<ClientAccount> ClientAccount { get; set; }
    }
}
