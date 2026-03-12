namespace ComfortFurniture.WebApp.ViewModels;

public sealed class ProductWorkshopsPageViewModel
{
    public int ProductId { get; set; }

    public string ProductName { get; set; } = string.Empty;

    public IReadOnlyList<WorkshopListItemViewModel> Workshops { get; set; } = Array.Empty<WorkshopListItemViewModel>();

    public double TotalProductionHours => Workshops.Sum(item => item.ProductionHours);

    public int TotalProductionHoursRounded => (int)Math.Ceiling(TotalProductionHours);
}
