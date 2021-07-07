using System.Collections.Generic;
using System.IO;
using System.Linq;
using CohortAnalysis.Model;

namespace CohortAnalysis.Services
{
    public class ExportManager : IExportManager
    {
        public void ExportAsCsv(IEnumerable<Cohort> cohorts, Stream stream)
        {
            var cohortsList = cohorts.ToList();

            var years = string.Join(",", cohortsList.Select(x => x.Segment.Year.ToString()).Distinct());

            using var writer = new StreamWriter(stream, leaveOpen: true);
            writer.WriteLine(years);
            writer.WriteLine(";Январь;Февраль;Март;Апрель;Май;Июнь;Июль;Август;Сентябрь;Октябрь;Ноябрь;Декабрь");
            foreach (var cohort in cohortsList)
            {
                writer.WriteLine($"{cohort.Segment:MMMM};{string.Join(";", cohort.Period)}");
            }
        }
    }
}