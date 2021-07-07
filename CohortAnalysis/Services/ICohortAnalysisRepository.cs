using System.Collections.Generic;
using System.Threading.Tasks;
using CohortAnalysis.Model;

namespace CohortAnalysis.Services
{
    public interface ICohortAnalysisRepository
    {
        Task<IEnumerable<CohortRow>> QueryCohortAnalysis();
    }
}