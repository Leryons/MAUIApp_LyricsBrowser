namespace lyricsBrowser.View
{
    public partial class SongDetails : ContentPage
    {

        public SongDetails(SongViewModel viewModel)
        {
            InitializeComponent();
            BindingContext = viewModel;
        }
    }
}