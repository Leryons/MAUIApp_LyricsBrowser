namespace LyricsBrowser.ViewModel;

[QueryProperty(nameof(CurrentSong), "CurrentSong")]
public partial class SongDetailsViewModel : BaseViewModel
{
    private readonly SongViewModel songViewModel;
    public SongDetailsViewModel(SongViewModel songViewModel)
    {
        this.songViewModel = songViewModel;
        CurrentSong = songViewModel.CurrentSong;
        songViewModel.PropertyChanged += OnSongViewModelPropertyChanged;
    }

    [ObservableProperty]
    Song currentSong;

    private void OnSongViewModelPropertyChanged(object sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName == nameof(songViewModel.CurrentSong))
        {
            CurrentSong = songViewModel.CurrentSong;
        }
    }
}