using System;
using System.Collections.Generic;

namespace CohortAnalysis.Model
{
    /// <summary>
    /// BL DTO
    /// </summary>
    public class Cohort
    {
        /// <summary>
        /// Cohort name
        /// </summary>
        public DateTime Segment { get; set; }

        /// <summary>
        /// Collection value by Period (by day, week, or month) 
        /// </summary>
        public IEnumerable<int> Period { get; set; }
    }
}