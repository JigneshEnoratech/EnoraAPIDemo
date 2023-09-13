using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Services;

namespace EnoraAPIDemo.Services
{
    public class TermsAndConditionService : ITermsAndConditionService
    {
        private readonly IUnitOfWork _unitOfWork;
        public TermsAndConditionService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

    }
}
