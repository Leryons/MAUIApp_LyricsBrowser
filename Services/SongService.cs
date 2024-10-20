namespace lyricsBrowser.Services;

public class SongService
{
    readonly HttpClient client = new HttpClient();
    public async Task<Song> SearchSong(string songName)
    {
            var url = $"https://test-beta-seven-33.vercel.app/api/genius/lyrics?q={songName}";

            HttpResponseMessage response = await client.GetAsync(url);

            string responseBody = await response.Content.ReadAsStringAsync();

            if (responseBody.StartsWith("{") || responseBody.StartsWith("["))
            {
                JObject songJson = JObject.Parse(responseBody);

                string title = songJson["title"]?.ToString();
                string artist = songJson["artist"]?.ToString();
                string lyrics = songJson["lyrics"]?.ToString();
                string albumName = songJson["albumName"]?.ToString();
                string albumImage = songJson["albumImageUrl"]?.ToString();
                string releaseDate = songJson["releaseDate"]?.ToString();

                Debug.WriteLine("Parsed Song Data:");
                Debug.WriteLine($"Title: {title}");
                Debug.WriteLine($"Artist: {artist}");
                Debug.WriteLine($"Lyrics: {lyrics}");
                Debug.WriteLine($"Album Name: {albumName}");
                Debug.WriteLine($"Album Image: {albumImage}");
                Debug.WriteLine($"Release Date: {releaseDate}");

                return new Song
                {
                    Title = title,
                    Artist = artist,
                    Lyrics = lyrics,
                    AlbumName = albumName,
                    AlbumImage = albumImage,
                    ReleaseDate = releaseDate
                };
            }
            return null;
    }
}
