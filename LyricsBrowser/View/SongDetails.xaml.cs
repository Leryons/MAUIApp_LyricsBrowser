namespace LyricsBrowser.View;

public partial class SongDetails : ContentPage
{
    public SongDetails(SongDetailsViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }

    protected override void OnNavigatedTo(NavigatedToEventArgs args)
    {
        base.OnNavigatedTo(args);
    }
}