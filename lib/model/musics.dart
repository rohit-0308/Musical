import 'dart:convert';

class CatalogMusic {
  static List<Music> songs;
}

class Music {
  final String title;
  final String thumnail;
  final String path;
  final String artist;
  final String movie;

  Music(
    this.title,
    this.thumnail,
    this.path,
    this.artist,
    this.movie,
  );

  Music copyWith({
    String title,
    String thumnail,
    String path,
    String artist,
    String movie,
  }) {
    return Music(
      title ?? this.title,
      thumnail ?? this.thumnail,
      path ?? this.path,
      artist ?? this.artist,
      movie ?? this.movie,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'thumnail': thumnail,
      'path': path,
      'artist': artist,
      'movie': movie,
    };
  }

  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      map['title'],
      map['thumnail'],
      map['path'],
      map['artist'],
      map['movie'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Music.fromJson(String source) => Music.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Music(title: $title, thumnail: $thumnail, path: $path, artist: $artist, movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Music &&
        other.title == title &&
        other.thumnail == thumnail &&
        other.path == path &&
        other.artist == artist &&
        other.movie == movie;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        thumnail.hashCode ^
        path.hashCode ^
        artist.hashCode ^
        movie.hashCode;
  }
}
