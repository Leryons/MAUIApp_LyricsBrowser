namespace lyricsBrowser;
public partial class MainPage : ContentPage
{
    public MainPage(SongViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }

    private async void GoToDetails(object sender, EventArgs e)
    {
        var detailsPage = new SongDetails((SongViewModel)BindingContext);

        await Navigation.PushAsync(detailsPage);

    }

    private async void Credits(object sender, EventArgs e)
    {
        await DisplayAlert("About it...", "App developed by: Leonardo Pulgar\nAPI developed by Eduard Fernandez\n\n*This API contains GeniusAPI functions.*", "OK");
    }
}