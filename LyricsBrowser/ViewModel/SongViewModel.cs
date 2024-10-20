namespace LyricsBrowser.ViewModel;
public partial class SongViewModel : BaseViewModel
{
    private readonly SongService songService;
    public SongViewModel(SongService songService)
    {
        this.songService = songService;
    }

    [ObservableProperty]
    private string songName;

    [ObservableProperty]
    public Song currentSong;

    [RelayCommand]
    async Task GoToDetailsAsync(Song song)
    {
        await Shell.Current.GoToAsync("SongDetails", true, new Dictionary<string, object>
        {
            {"CurrentSong", currentSong}
        });
    }

    [RelayCommand]
    public async Task SearchSongAsync()
    {
        if (IsBusy) return;
        try
        {
            IsBusy = true;
            if (string.IsNullOrEmpty(songName))
            {
                Debug.WriteLine("songName is null or empty");
                return;
            }
            CurrentSong = await songService.SearchSong(songName);
            if (CurrentSong == null)
            {
                Debug.WriteLine("No song found");
            }
            else
            {
                Debug.WriteLine("Song found: " + CurrentSong.Title);
                OnPropertyChanged(nameof(CurrentSong));
            }
        }
        catch (Exception ex)
        {
            Debug.WriteLine($"Unable to get the specific lyric: {ex.Message}");
            await Shell.Current.DisplayAlert("Error!", ex.Message, "OK");
        }
        finally
        {
            IsBusy = false;
        }
    }
}