using System.Security.Cryptography.X509Certificates;

namespace LyricsBrowser.View;
public partial class MainPage : ContentPage
{
    public MainPage(SongViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }
    private void SendSongName(object sender, EventArgs e)
    {
        if (BindingContext is SongViewModel songViewModel)
        {
            songViewModel.SearchSongCommand.Execute(null);
        }
    }
}