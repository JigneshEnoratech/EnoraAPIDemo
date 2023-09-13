using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EnoraAPIDemo.Api.Attributes;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Core.ViewModels;
using EnoraAPIDemo.Utility;

namespace EnoraAPIDemo.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [UserAuthentication]
    public class DashBoardWidgetController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly ILogger<DashBoardWidgetController> _logger;

        public DashBoardWidgetController(
            ILogger<DashBoardWidgetController> logger, IMapper mapper
            )
        {
            _mapper = mapper;
            _logger = logger;
        }

       


       

        
    }
}
