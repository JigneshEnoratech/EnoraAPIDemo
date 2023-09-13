using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnoraAPIDemo.Core.ViewModels
{
    public class GuideModuleModel
    {
        public bool DomainInformation { get; set; }
        public bool SocialMedia { get; set; }
        public bool SensitiveCodeExposure { get; set; }
        public bool SearchEngineExploitation { get; set; }
        public bool CloudeExposure { get; set; }
        public bool OnlineTextSharingRepositories { get; set; }
        public bool CompanySentimentsOrFinancials { get; set; }
        public bool ArchivedWebPages { get; set; }
        public bool DarkWeb { get; set; }
        public bool TechnologyStack { get; set; }
        public bool AnalysisDomainInformation { get; set; }
        public bool AnalysisSocialMedia { get; set; }
        public bool AnalysisSensitiveCodeExposure { get; set; }
        public bool AnalysisSearchEngineExploitation { get; set; }
        public bool AnalysisCloudeExposure { get; set; }
        public bool AnalysisOnlineTextSharingRepositories { get; set; }
        public bool AnalysisCompanySentimentsOrFinancials { get; set; }
        public bool AnalysisArchivedWebPages { get; set; }
        public bool AnalysisDarkWeb { get; set; }
    }

    

    public class GuideModuleConfirmationModel
    {
        public int Id { get; set; }
        public string CheckId { get; set; }
        public int ParentCheckId { get; set; }
        public string ParentName { get; set; }
        public string Name { get; set; }
        public bool isChecked { get; set; }
        public bool isIncluded { get; set; }
        public string EstimatedCompletionTime { get; set; }

        public List<SelectDDList> Wordlist { get; set; }
        public int WordlistId { get; set; }
    }

    public class SelectDDList
    {
        public bool Selected { get; set; }
        public string Text { get; set; }
        public string Value { get; set; }
    }
}
