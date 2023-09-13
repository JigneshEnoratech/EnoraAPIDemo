using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.Services
{
    public interface IItemMasterService
    {
        Task<ItemMaster> CreateItem(ItemMaster itemMaster);
        Task<ItemMaster> UpdateItem(ItemMasterModel itemMaster);
        Task<ItemMaster> GetItemById(int id);
        Task<PaginatedItemResult> ShowItemList(Page page);
    }
}
