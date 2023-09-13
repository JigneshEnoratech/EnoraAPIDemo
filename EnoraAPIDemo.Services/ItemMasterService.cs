using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Core.ViewModels;

namespace EnoraAPIDemo.Services
{
    public class ItemMasterService : IItemMasterService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ItemMasterService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<ItemMaster> CreateItem(ItemMaster itemMaster)
        {
            await _unitOfWork.ItemMaster.AddAsync(itemMaster);
            await _unitOfWork.CommitAsync();
            return itemMaster;
        }

        public async Task<ItemMaster> UpdateItem(ItemMasterModel itemMaster)
        {
            return await _unitOfWork.ItemMaster.UpdateItem(itemMaster);
        }

        public async Task<PaginatedItemResult> ShowItemList(Page page)
        {
            return await _unitOfWork.ItemMaster.ShowItemList(page);
        }
        public async Task<ItemMaster> GetItemById(int id)
        {
            return await _unitOfWork.ItemMaster.GetItemIdByIdAsync(id);
        }
    }
}
