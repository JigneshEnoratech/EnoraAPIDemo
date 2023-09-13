using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Api.Attributes;
using EnoraAPIDemo.Api.Resources;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Core.ViewModels;
using EnoraAPIDemo.Services;
using YamlDotNet.Core;
using EnoraAPIDemo.Core.Models;

namespace EnoraAPIDemo.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [UserAuthentication]
    public class ItemController : ControllerBase
    {
        public readonly IConfiguration Configuration;
        private readonly IMapper _mapper;
        private readonly ILogger<ItemController> _logger;
        private readonly IItemMasterService _itemMasterService;
        public ItemController(IConfiguration configuration,
           ILogger<ItemController> logger, IMapper mapper, IItemMasterService itemMasterService
           )
        {
            Configuration = configuration;
            _mapper = mapper;
            _logger = logger;
            _itemMasterService= itemMasterService;
        }

        [HttpPost("AddItem")]
        public async Task<ActionResult> AddItem([FromBody] ItemResource model)
        {
            CustomResponse response = new CustomResponse();
            try
            {
                var UserId = Convert.ToInt32(User.FindFirst("UserID")?.Value);
                ItemMaster item = new ItemMaster();
                item.ItemName = model.ItemName;
                item.IsActive = model.IsActive;
                item.IsDelete = model.IsDelete;
                item.CreatedDate = DateTime.UtcNow;
                item.CreatedBy = UserId;
                ItemMaster itemResponse= await _itemMasterService.CreateItem(item);
                return Ok(itemResponse);
            }
            catch (Exception ex)
            {
                _logger.LogInformation($"Item :  [{model.ItemName}]\n[unable to Add Item ]\nError [{ex}]");
            }
            return Ok(false) ;

        }
        [HttpPost("UpdateItem")]
        public async Task<ActionResult> UpdateItem([FromBody] ItemResource model)
        {
            CustomResponse response = new CustomResponse();
            try
            {
                var UserId = Convert.ToInt32(User.FindFirst("UserID")?.Value);
                ItemMasterModel item = new ItemMasterModel();
                item.ID = model.ID;
                item.ItemName = model.ItemName;
                item.IsActive = model.IsActive;
                item.IsDelete = model.IsDelete;
                item.UpdatedDate = DateTime.UtcNow;
                item.UpdatedBy = UserId;
                ItemMaster itemResponse = await _itemMasterService.UpdateItem(item);
                return Ok(itemResponse);
            }
            catch (Exception ex)
            {
                _logger.LogInformation($"Item :  [{model.ItemName}]\n[unable to Add Item ]\nError [{ex}]");
            }
            return Ok(false);

        }
        [HttpGet("GetItemById/{id}")]
        //[UserAuthorization]
        public async Task<ActionResult<ItemResource>> GetItemById(int id)
        {
            var item = await _itemMasterService.GetItemById(id);
            if (item != null)
            {
                var itemResource = _mapper.Map<ItemMaster, ItemResource>(item);
                return Ok(itemResource);
            }
            else
            {
                return NoContent();
            }
        }

        [HttpPost("GetItemList")]
        public async Task<ActionResult> GetItemList([FromBody] Page model)
        {
            PaginatedItemResult data = new PaginatedItemResult();
            try
            {
                data = await _itemMasterService.ShowItemList(model);
            }
            catch (Exception ex)
            {
                _logger.LogInformation("Controller: ItemController");
                _logger.LogInformation("Method: GetItemList");
                _logger.LogInformation(ex.Message.ToString());
                _logger.LogInformation(ex.StackTrace.ToString());

            }
            return Ok(data);
        }

    }
}
