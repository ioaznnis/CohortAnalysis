using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using CohortAnalysis.Model;
using Dapper;

namespace CohortAnalysis.Services
{
    public class CohortAnalysisRepository : ICohortAnalysisRepository
    {
        private readonly IDbConnection _dbConnection;

        public CohortAnalysisRepository(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        public async Task<IEnumerable<CohortRow>> QueryCohortAnalysis() =>
            await _dbConnection.QueryAsync<CohortRow>(SqlQuery.CohortAnalysisQuery);
    }
}