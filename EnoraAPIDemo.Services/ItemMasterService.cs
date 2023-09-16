using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Core.ViewModels;

namespace EnoraAPIDemo.Services
{
    public class ItemMasterService : IItemMasterService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        public ItemMasterService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this._unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<ItemResource> CreateItem(ItemResource itemMaster)
        {
            ItemMaster item = _mapper.Map<ItemResource, ItemMaster>(itemMaster);
            await _unitOfWork.ItemMaster.AddAsync(item);
            await _unitOfWork.CommitAsync();
            return _mapper.Map<ItemMaster, ItemResource>(item); 
        }

        public async Task<ItemUpdateResource> UpdateItem(ItemUpdateResource itemMaster)
        {
            ItemMaster item = _mapper.Map<ItemUpdateResource, ItemMaster>(itemMaster);
            item= await _unitOfWork.ItemMaster.UpdateItem(item);
            return _mapper.Map<ItemMaster, ItemUpdateResource>(item);
        }

        public async Task<PaginatedItemResult> ShowItemList(Page page)
        {
            return await _unitOfWork.ItemMaster.ShowItemList(page);
        }
        
        public async Task<ItemMaster> GetItemById(int id)
        {
            return await _unitOfWork.ItemMaster.GetItemIdByIdAsync(id);
        }

        public async Task<PaginatedItemResult> ShowResult(Page page)
        {
            var total = _unitOfWork.ItemMaster.Find(x =>x.IsActive==true && x.IsDelete==false).Count();

            var dataAll = await _unitOfWork.ItemMaster.GetCustomListAsync(
            source => new ItemMasterModel
            {
                ID = source.ID,
                ItemName = source.ItemName,
                IsActive = source.IsActive,
            },
            filter: c => c.IsActive == true && c.IsDelete == false);

            var data = dataAll.OrderByDescending(x => Convert.ToInt32(x.CreatedDate)).Skip(page.startIndex * page.pageSize).Take(page.pageSize);

            page.totalPage = (total + page.pageSize - 1) / page.pageSize;

            PaginatedItemResult itemResult = new PaginatedItemResult
            {
                Page = page,
                Data = data.ToList()
            };
            return itemResult;
        }
    }
}
