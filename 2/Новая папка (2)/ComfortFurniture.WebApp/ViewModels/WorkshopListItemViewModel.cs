namespace ComfortFurniture.WebApp.ViewModels;

public sealed class WorkshopListItemViewModel
{
    public string Name { get; set; } = string.Empty;

    public string WorkshopType { get; set; } = string.Empty;

    public int EmployeeCount { get; set; }

    public double ProductionHours { get; set; }
}
