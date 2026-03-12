using ComfortFurniture.WebApp.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();

builder.Services.AddSingleton<DatabaseBootstrapper>();
builder.Services.AddSingleton<SqliteConnectionFactory>();
builder.Services.AddScoped<LookupRepository>();
builder.Services.AddScoped<ProductRepository>();
builder.Services.AddScoped<WorkshopRepository>();
builder.Services.AddScoped<MaterialCalculatorService>();

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var bootstrapper = scope.ServiceProvider.GetRequiredService<DatabaseBootstrapper>();
    bootstrapper.EnsureDatabaseCreated();
}

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
