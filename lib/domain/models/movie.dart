// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie copyWith({
    required bool adult,
    required String backdropPath,
    required List<int> genreIds,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required DateTime releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) =>
      Movie(
        adult: this.adult,
        backdropPath: this.backdropPath,
        genreIds: this.genreIds,
        id: this.id,
        originalLanguage: this.originalLanguage,
        originalTitle: this.originalTitle,
        overview: this.overview,
        popularity: this.popularity,
        posterPath: this.posterPath,
        releaseDate: this.releaseDate,
        title: this.title,
        video: this.video,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount,
      );
//transforma el map en un objeto
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: (json["genre_ids"] as List).map((e) => e as int).toList(),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: (json["popularity"] as num).toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: (json["vote_average"] as num).toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  String getImage() {
    return "https://image.tmdb.org/t/p/w500/$posterPath";
  }

  String getImageHd() {
    return "https://image.tmdb.org/t/p/original/$posterPath";
  }
}
