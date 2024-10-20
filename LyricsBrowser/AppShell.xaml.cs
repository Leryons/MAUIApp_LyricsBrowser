namespace LyricsBrowser;
public partial class AppShell : Shell
{
    public AppShell()
    {
        InitializeComponent();

        Routing.RegisterRoute(nameof(SongDetails), typeof(SongDetails));
        Routing.RegisterRoute(nameof(MainPage), typeof(MainPage));
        Routing.RegisterRoute(nameof(InfoPage), typeof(InfoPage));
    }
}