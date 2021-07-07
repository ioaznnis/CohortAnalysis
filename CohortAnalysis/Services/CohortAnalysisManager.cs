using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CohortAnalysis.Model;

namespace CohortAnalysis.Services
{
    public class CohortAnalysisManager : ICohortAnalysisManager
    {
        private readonly ICohortAnalysisRepository _repository;

        public CohortAnalysisManager(ICohortAnalysisRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<Cohort>> ExecuteCohortAnalysis()
        {
            var cohortRows = await _repository.QueryCohortAnalysis();
            return cohortRows.Select(x => new Cohort
            {
                Segment = x.Cohort,
                Period = new[]
                {
                    x.Month0, x.Month1, x.Month2,
                    x.Month3, x.Month4, x.Month5,
                    x.Month6, x.Month7, x.Month8,
                    x.Month9, x.Month10, x.Month11
                }
            });
        }
    }
}