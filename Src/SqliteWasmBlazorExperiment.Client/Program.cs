using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using SqliteWasmBlazor;
using SqliteWasmBlazorExperiment.Ef;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

// Add your DbContext with SqliteWasm provider
builder.Services.AddDbContextFactory<TodoDbContext>(options =>
{
    options.UseSqliteWasm("Data Source=TodoDb.db");
});

builder.Services.AddSqliteWasm();

var host = builder.Build();

// Initialize SqliteWasm database with automatic migration support
await host.Services.InitializeSqliteWasmDatabaseAsync<TodoDbContext>();

await host.RunAsync();
