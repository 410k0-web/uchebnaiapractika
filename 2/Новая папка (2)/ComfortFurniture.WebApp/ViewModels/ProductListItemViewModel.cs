namespace ComfortFurniture.WebApp.ViewModels;

public sealed class ProductListItemViewModel
{
    public int ProductId { get; set; }

    public int Article { get; set; }

    public string ProductTypeName { get; set; } = string.Empty;

    public string Name { get; set; } = string.Empty;

    public decimal PartnerMinPrice { get; set; }

    public string MaterialTypeName { get; set; } = string.Empty;

    public double TotalProductionHours { get; set; }

    public int TotalProductionHoursRounded => (int)Math.Ceiling(TotalProductionHours);
}
