using System.Collections.Generic;
using System.Threading.Tasks;
using CohortAnalysis.Model;

namespace CohortAnalysis.Services
{
    public interface ICohortAnalysisManager
    {
        Task<IEnumerable<Cohort>> ExecuteCohortAnalysis();
    }
}