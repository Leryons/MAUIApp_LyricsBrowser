namespace lyricsBrowser.ViewModel;

public partial class SongViewModel : BaseViewModel

{
    readonly SongService songService;

    public SongViewModel(SongService songService)
    {
        this.songService = songService;
    }

    [ObservableProperty]
    private string _songName;

    [ObservableProperty]
    private Song _currentSong;

    [RelayCommand]
    async Task SearchSongAsync() 
    {
        if (IsBusy) 
        {
            return;
        }

        try
        {
            IsBusy = true;
            CurrentSong = await songService.SearchSong(SongName);
        }

        catch (Exception ex)
        {
            Debug.WriteLine(ex);
        }

        finally 
        {
            IsBusy = false;
        }
        
    }
}
