void main() {
  var myPlaylist = Playlist('Рок-музика', [
    Song('Пісня 1', 'Виконавець 1', 3.5, 2020),
    Song('Пісня 2', 'Виконавець 2', 4.2, 2019),
    Song('Пісня 3', 'Виконавець 3', 3.0, 2021),
    Song('Пісня 4', 'Виконавець 4', 3.5, 2020),
    Song('Пісня 5', 'Виконавець 2', 4.2, 2019),
    Song('Пісня 6', 'Виконавець 5', 3.0, 2021),
    Song('Пісня 7', 'Виконавець 6', 3.5, 2020),
    Song('Пісня 8', 'Виконавець 7', 4.2, 2019),
    Song('Пісня 9', 'Виконавець 3', 3.0, 2021),
    Song('Пісня 10', 'Виконавець 8', 3.5, 2020),
    Song('Пісня 11', 'Виконавець 2', 4.2, 2019),
    Song('Пісня 12', 'Виконавець 3', 3.0, 2021),
    Song('Пісня 13', 'Виконавець 9', 3.5, 2020),
    Song('Пісня 14', 'Виконавець 10', 4.2, 2019),
    Song('Пісня 15', 'Виконавець 11', 3.0, 2021),
    Song('Пісня 16', 'Виконавець 12', 3.5, 2020),
    Song('Пісня 17', 'Виконавець 13', 4.2, 2019),
    Song('Пісня 18', 'Виконавець 3', 3.0, 2021),
    Song('Пісня 19', 'Виконавець 14', 3.5, 2020),
    Song('Пісня 20', 'Виконавець 2', 4.2, 2019),
    Song('Пісня 21', 'Виконавець 3', 3.0, 2021),
    Song('Пісня 22', 'Виконавець 15', 3.5, 2020),
    Song('Пісня 23', 'Виконавець 16', 4.2, 2019),
    Song('Пісня 24', 'Виконавець 3', 3.0, 2021),
    Song('Пісня 25', 'Виконавець 17', 3.5, 2020),
    Song('Пісня 26', 'Виконавець 18', 4.2, 2019),
    Song('Пісня 27', 'Виконавець 19', 3.0, 2021),
    Song('Пісня 28', 'Виконавець 20', 3.5, 2020),
    Song('Пісня 29', 'Виконавець 21', 4.3, 2019),
    Song('Пісня 30', 'Виконавець 3', 3.0, 2021)
  ]);

  // Пошук по автору
  String artistToSearch = 'Виконавець 3';
  List<Song> songsByArtist =
      myPlaylist.searchByArtist(artistToSearch, myPlaylist.songs);
  double durationArtistToSearch =
      myPlaylist.calculateTotalDuration(songsByArtist);

  if (songsByArtist.isNotEmpty) {
    print('Пісні виконавця "$artistToSearch":');
    for (var song in songsByArtist) {
      print('${song.title} - ${song.duration} хвилин');
    }
  } else {
    print('Пісні виконавця "$artistToSearch" не знайдено.');
  }
  print('Тривалість цих пісень: ' +
      durationArtistToSearch.toStringAsFixed(2) +
      ' хвилин');
  print('\n');

  // Пошук по назві пісні
  String titleToSearch = 'Пісня 2';
  List<Song> songsByTitle =
      myPlaylist.searchByTitle(titleToSearch, myPlaylist.songs);
  double durationSongsByTitle = myPlaylist.calculateTotalDuration(songsByTitle);

  if (songsByTitle.isNotEmpty) {
    print('Пісні з назвою "$titleToSearch":');
    for (var song in songsByTitle) {
      print('${song.title} - ${song.duration} хвилин');
    }
  } else {
    print('Пісні з назвою "$titleToSearch" не знайдено.');
  }
  print('Тривалість цих пісень: ' +
      durationSongsByTitle.toStringAsFixed(2) +
      ' хвилин');
  print('\n');

  // Отримання тривалості пісень
  List<Song> allSongs = myPlaylist.songs;
  double durationOfAllSong = myPlaylist.calculateTotalDuration(allSongs);
  print('Тривалість плейлиста: ' +
      durationOfAllSong.toStringAsFixed(2) +
      ' хвилин');
}

class Song {
  String title;
  String artist;
  double duration;
  int releaseYear;

  Song(this.title, this.artist, this.duration, this.releaseYear);
}

class Playlist with SearchMixin {
  String title;
  List<Song> songs;

  Playlist(this.title, this.songs);

  // Метод для обчислення загальної тривалості пісень у плейлисті
  double calculateTotalDuration(songs) {
    double totalDuration = 0.0;
    for (var song in songs) {
      totalDuration += song.duration;
    }
    return totalDuration;
  }
}

mixin SearchMixin {
  // Метод для пошуку пісень за назвою
  List<Song> searchByTitle(String title, List<Song> songs) {
    return songs.where((song) => song.title.contains(title)).toList();
  }

  // Метод для пошуку пісень за виконавцем
  List<Song> searchByArtist(String artist, List<Song> songs) {
    return songs.where((song) => song.artist.contains(artist)).toList();
  }
}
