using AutoMapper;
using EnoraAPIDemo.Api.Resources;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.ViewModels;

namespace EnoraAPIDemo.Api.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // Domain to Resource
            CreateMap<User, UserResource>();
            // Resource to Domain
            CreateMap<UserResource, User>();
            CreateMap<ItemMaster, ItemMasterModel>();
            CreateMap<ItemMasterModel, ItemMaster>();
            CreateMap<ItemMaster, ItemResource>();
            CreateMap<ItemResource, ItemMaster>();
        }
    }
}