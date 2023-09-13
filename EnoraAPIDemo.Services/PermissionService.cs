using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Services;

namespace EnoraAPIDemo.Services
{
    public class PermissionService : IPermissionService
    {
        private readonly IUnitOfWork _unitOfWork;
        public PermissionService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
    }
}
