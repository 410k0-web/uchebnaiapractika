using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ComfortFurniture.WebApp.ViewModels;

public sealed class MaterialCalculatorViewModel
{
    [Display(Name = "Тип продукции")]
    [Range(1, int.MaxValue, ErrorMessage = "Выберите тип продукции.")]
    public int ProductTypeId { get; set; }

    [Display(Name = "Тип материала")]
    [Range(1, int.MaxValue, ErrorMessage = "Выберите тип материала.")]
    public int MaterialTypeId { get; set; }

    [Display(Name = "Количество продукции")]
    [Range(1, int.MaxValue, ErrorMessage = "Количество должно быть положительным.")]
    public int ProductCount { get; set; } = 1;

    [Display(Name = "Параметр 1")]
    [Range(0.000001, double.MaxValue, ErrorMessage = "Введите положительное число.")]
    public double Parameter1 { get; set; } = 1;

    [Display(Name = "Параметр 2")]
    [Range(0.000001, double.MaxValue, ErrorMessage = "Введите положительное число.")]
    public double Parameter2 { get; set; } = 1;

    public int? Result { get; set; }

    public string? Message { get; set; }

    public IReadOnlyList<SelectListItem> ProductTypes { get; set; } = Array.Empty<SelectListItem>();

    public IReadOnlyList<SelectListItem> MaterialTypes { get; set; } = Array.Empty<SelectListItem>();
}
