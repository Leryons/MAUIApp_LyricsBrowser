namespace lyricsBrowser
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            SongService songService = new SongService();
            Debug.WriteLine("SongService initialized");

            SongViewModel viewModel = new SongViewModel(songService);
            Debug.WriteLine("SongViewModel initialized");

            MainPage = new NavigationPage(new MainPage(new SongViewModel(songService)));

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
}
