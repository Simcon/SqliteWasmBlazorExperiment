using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace SqliteWasmBlazorExperiment.Ef;

/// <summary>
/// Design-time factory for EF Core tooling (migrations, etc.).
/// Uses a local SQLite database for schema management at design time.
/// </summary>
public class TodoDbContextFactory : IDesignTimeDbContextFactory<TodoDbContext>
{
    public TodoDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<TodoDbContext>();
        optionsBuilder.UseSqlite("Data Source=TodoDb.db");

        return new TodoDbContext(optionsBuilder.Options);
    }
}
