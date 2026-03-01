using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ComfortFurniture.WebApp.ViewModels;

public sealed class ProductEditorViewModel
{
    public int? ProductId { get; set; }

    [Display(Name = "Артикул")]
    [Range(1, int.MaxValue, ErrorMessage = "Укажите корректный артикул.")]
    public int Article { get; set; }

    [Display(Name = "Тип продукции")]
    [Range(1, int.MaxValue, ErrorMessage = "Выберите тип продукции.")]
    public int ProductTypeId { get; set; }

    [Display(Name = "Наименование")]
    [Required(ErrorMessage = "Укажите наименование продукции.")]
    [StringLength(200, ErrorMessage = "Наименование должно быть не длиннее 200 символов.")]
    public string Name { get; set; } = string.Empty;

    [Display(Name = "Минимальная стоимость для партнера")]
    [Range(typeof(decimal), "0", "999999999", ErrorMessage = "Стоимость не может быть отрицательной.")]
    public decimal PartnerMinPrice { get; set; }

    [Display(Name = "Основной материал")]
    [Range(1, int.MaxValue, ErrorMessage = "Выберите основной материал.")]
    public int MaterialTypeId { get; set; }

    public IReadOnlyList<SelectListItem> ProductTypes { get; set; } = Array.Empty<SelectListItem>();

    public IReadOnlyList<SelectListItem> MaterialTypes { get; set; } = Array.Empty<SelectListItem>();

    public string PageTitle { get; set; } = string.Empty;

    public string SubmitButtonText { get; set; } = "Сохранить";
}
