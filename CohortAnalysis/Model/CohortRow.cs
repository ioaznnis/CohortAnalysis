using System;

namespace CohortAnalysis.Model
{
    /// <summary>
    /// Repository DTO 
    /// </summary>
    public record CohortRow
    {
        public DateTime Cohort { get; set; }
        public int Month0 { get; set; }
        public int Month1 { get; set; }
        public int Month2 { get; set; }
        public int Month3 { get; set; }
        public int Month4 { get; set; }
        public int Month5 { get; set; }
        public int Month6 { get; set; }
        public int Month7 { get; set; }
        public int Month8 { get; set; }
        public int Month9 { get; set; }
        public int Month10 { get; set; }
        public int Month11 { get; set; }
    }
}