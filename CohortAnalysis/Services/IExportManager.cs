using System.Collections.Generic;
using System.IO;
using CohortAnalysis.Model;

namespace CohortAnalysis.Services
{
    public interface IExportManager
    {
        void ExportAsCsv(IEnumerable<Cohort> cohorts, Stream stream);
    }
}