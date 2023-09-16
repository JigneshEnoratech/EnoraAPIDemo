using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.ViewModels;
using System.Linq;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.Repositories
{
    public interface IItemMasterRepository : IRepository<ItemMaster>
    {
        Task<ItemMaster> UpdateItem(ItemMaster model);
        Task<PaginatedItemResult> ShowItemList(Page page);
        Task<ItemMaster> GetItemIdByIdAsync(int id);
    }
}