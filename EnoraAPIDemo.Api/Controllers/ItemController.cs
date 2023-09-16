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
using System.Security.Claims;

namespace EnoraAPIDemo.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [UserAuthentication]
    [UserAuthorization]
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
            CustomResponse<ItemResource> response = new CustomResponse<ItemResource>();
            try
            {                           
                var UserId = Convert.ToInt32(User.FindFirst("UserID")?.Value);
                model.CreatedDate = DateTime.UtcNow;
                model.CreatedBy = UserId;
                response.data = await _itemMasterService.CreateItem(model);
                response.Status = true;
            }
            catch (Exception ex)
            {
                _logger.LogInformation($"Item :  [{model.ItemName}]\n[unable to Add Item ]\nError [{ex}]");
                response.Status = false;
            }
            return Ok(response) ;
        }
        [HttpPost("UpdateItem")]
        public async Task<ActionResult> UpdateItem([FromBody] ItemUpdateResource model)
        {
            CustomResponse<ItemUpdateResource> response = new CustomResponse<ItemUpdateResource>();
            try
            {
                var UserId = Convert.ToInt32(User.FindFirst("UserID")?.Value);
                model.UpdatedDate = DateTime.UtcNow;
                model.UpdatedBy = UserId;
                response.data = await _itemMasterService.UpdateItem(model);
                response.Status = true;
            }
            catch (Exception ex)
            {
                _logger.LogInformation($"Item :  [{model.ItemName}]\n[unable to Add Item ]\nError [{ex}]");
                response.Status = false;
            }
            return Ok(response);
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
        [HttpPost("GetAllItemList")]
        public async Task<ActionResult> GetAllItemList([FromBody] Page model)
        {
            PaginatedItemResult data = new PaginatedItemResult();
            try
            {
                data = await _itemMasterService.ShowResult(model);
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
