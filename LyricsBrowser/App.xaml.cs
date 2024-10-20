namespace LyricsBrowser;
public partial class App : Application
{
    public App()
    {
        InitializeComponent();

        MainPage = new AppShell();

        AppDomain.CurrentDomain.UnhandledException += (sender, e) =>
        {
            if (e.ExceptionObject is Exception ex)
            {
                Debug.WriteLine($"Unhandled exception: {ex}");
            }
        };

        TaskScheduler.UnobservedTaskException += (sender, e) =>
        {
            Debug.WriteLine($"Unobserved task exception: {e.Exception}");
            e.SetObserved();
        };
    }
}