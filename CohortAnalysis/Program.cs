using System;
using System.Data;
using System.IO;
using CohortAnalysis.Services;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

var configuration = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json")
    .AddCommandLine(args)
    .Build();

var serviceProvider = new ServiceCollection()
    .AddScoped<IDbConnection>(_ => new SqlConnection(configuration.GetConnectionString("DefaultConnection")))
    .AddScoped<ICohortAnalysisRepository, CohortAnalysisRepository>()
    .AddScoped<ICohortAnalysisManager, CohortAnalysisManager>()
    .AddScoped<IExportManager, ExportManager>()
    .BuildServiceProvider();

using var serviceScope = serviceProvider.CreateScope();

Console.WriteLine("Starting...");

var cohortAnalysisManager = serviceScope.ServiceProvider.GetRequiredService<ICohortAnalysisManager>();
var cohorts = await cohortAnalysisManager.ExecuteCohortAnalysis();

Console.WriteLine("Query data from DB...");

var exportManager = serviceScope.ServiceProvider.GetRequiredService<IExportManager>();

var path = configuration.GetSection("ExportPath").Value;
if (string.IsNullOrWhiteSpace(path))
    throw new InvalidOperationException("ExportPath IsNullOrWhiteSpace!");

using (var fileStream = File.OpenWrite(path))
{
    exportManager.ExportAsCsv(cohorts, fileStream);
}



