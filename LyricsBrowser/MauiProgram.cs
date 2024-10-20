namespace LyricsBrowser;
public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                fonts.AddFont("Roboto-Regular.ttf", "Roboto");
            });

#if DEBUG
    	builder.Logging.AddDebug();
#endif

        builder.Services.AddSingleton<SongService>();
        builder.Services.AddSingleton<SongViewModel>();
        builder.Services.AddTransient<SongDetailsViewModel>();
        builder.Services.AddSingleton<MainPage>();
        builder.Services.AddTransient<SongDetails>();

        return builder.Build();
    }
}
