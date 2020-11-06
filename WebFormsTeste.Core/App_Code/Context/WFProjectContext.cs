using System.Data.Entity;
using Models;

/// <summary>
/// Summary description for WFProjectContext
/// </summary>

public class WFProjectContext : DbContext
{
    public WFProjectContext() : base("WFProjectBase")
    {
    }

    public DbSet<Pessoa> Pessoas { get; set; }
}