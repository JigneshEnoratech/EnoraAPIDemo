using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using EnoraAPIDemo.Api.Attributes;
using EnoraAPIDemo.Api.Resources;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Core.ViewModels;
using EnoraAPIDemo.Utility;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.NamingConventions;

namespace EnoraAPIDemo.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [UserAuthentication]
    public class JobController : ControllerBase
    {
        private readonly ILogger<JobController> _logger;
        private readonly IMapper _mapper;
        public readonly IConfiguration _Configuration;

        public JobController(ILogger<JobController> logger, IConfiguration configuration, 
            IMapper mapper
            )
        {
            _Configuration = configuration;
            _mapper = mapper;
            _logger = logger;
        }

        

       

       
    }
}
