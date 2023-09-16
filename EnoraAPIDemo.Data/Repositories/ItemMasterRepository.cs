using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Repositories;
using EnoraAPIDemo.Core.ViewModels;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace EnoraAPIDemo.Data.Repositories
{
    public class ItemMasterRepository : Repository<ItemMaster>, IItemMasterRepository
    {
        private EnoraAPIDemoAPIContext _DbContext
        {
            get { return Context as EnoraAPIDemoAPIContext; }
        }

        public ItemMasterRepository(EnoraAPIDemoAPIContext context)
            : base(context)
        { }

        public async Task<ItemMaster> UpdateItem(ItemMaster model)
        {
            var ItemMaster = await _DbContext.ItemMaster.Where(x => x.ID == model.ID).FirstOrDefaultAsync();
            if (ItemMaster != null)
            {
                if (model.ItemName != null)
                    ItemMaster.ItemName = model.ItemName;
                ItemMaster.UpdatedBy = model.UpdatedBy;
                ItemMaster.UpdatedDate = DateTime.UtcNow;
                await _DbContext.SaveChangesAsync();
            }
            return ItemMaster;
        }

        public async Task<ItemMaster> GetItemIdByIdAsync(int id)
        {
            return await _DbContext.ItemMaster
                 .Where(c =>c.ID == id && c.IsDelete == false)
                .SingleOrDefaultAsync(m => m.ID == id);
        }
       
        public async Task<PaginatedItemResult> ShowItemList(Page page)
        {
            List<ItemMasterModel> resultSubDomains = new List<ItemMasterModel>();
            var totalCount = 0;
            var spName = "[sp_GetItemList]";
            DataTable dt = new DataTable();
            using (var command = _DbContext.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = spName;
                command.CommandType = CommandType.StoredProcedure;


                command.Parameters.Add(new SqlParameter("@start", page.startIndex));
                command.Parameters.Add(new SqlParameter("@length", page.pageSize));
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@totalCount";
                outparam.SqlDbType = SqlDbType.BigInt;
                outparam.Direction = ParameterDirection.Output;
                command.Parameters.Add(outparam);
                if (_DbContext.Database.GetDbConnection().State != ConnectionState.Open)
                    _DbContext.Database.OpenConnection();
                using (var result = await command.ExecuteReaderAsync())
                {

                    dt.Load(result);
                    totalCount = Convert.ToInt32(command.Parameters["@totalCount"].Value);
                }
                if (_DbContext.Database.GetDbConnection().State != ConnectionState.Closed)
                    _DbContext.Database.CloseConnection();
            }

            foreach (DataRow item in dt.Rows)
            {
                resultSubDomains.Add(new ItemMasterModel
                {
                    ID = Convert.ToInt32(item["ID"]),
                    CreatedBy = Convert.ToInt32(item["CreatedBy"]),
                    ItemName = Convert.ToString(item["ItemName"]),
                    IsActive = Convert.ToBoolean(item["IsActive"]),
                    IsDelete = Convert.ToBoolean(item["IsDelete"]),
                    CreatedDate = Convert.ToDateTime(item["CreatedDate"])
                });
            }
            page.totalPage = (totalCount + page.pageSize - 1) / page.pageSize;
            PaginatedItemResult scanResult = new PaginatedItemResult
            {
                Page = page,
                Data = resultSubDomains
            };
            return scanResult;
        }

        
    }
}
