using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class SearchModel
    {
        public string CompanyName { get; set; }
        public string DomainName { get; set; }
        public bool HasSubDomain { get; set; }
    }
    public class FiletrLatestResultModel
    {
        public List<int> moduleIds { get; set; }
        public int entityId { get; set; }


    }
    public class FilterCompanyArchiveAnalysis
    {
        public List<long> SchedulerScanResultId { get; set; }
    }
    public class CompanyFilterResultModel
    {
        public int moduleId { get; set; }
        public int entityId { get; set; }
        public long SchedulerScanResultId { get; set; }

    }
}
