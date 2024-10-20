namespace LyricsBrowser.ViewModel;

public partial class BaseViewModel : ObservableObject
{
    public BaseViewModel() { }

    [ObservableProperty]
    [NotifyPropertyChangedFor(nameof(IsNotBusy))]
    bool isBusy;

    public bool IsNotBusy => !IsBusy;
}