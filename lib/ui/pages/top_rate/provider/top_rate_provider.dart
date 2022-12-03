import 'package:flutter/material.dart';
import 'package:the_movie_db/domain/models/movie.dart';
import 'package:the_movie_db/services/the_movie_db_service.dart';

class TopRateProvider extends ChangeNotifier {
  List<Movie> movies = [];

  Future<List<Movie>> getTopMoves() async {
    if (movies.isNotEmpty) {
      return movies;
    }

    movies = await TheMovieDbService.getTopRateMovies();
    notifyListeners();
    return movies;
  }

  Future<List<Movie>> refreshTopPeliculas() async {
    movies = await TheMovieDbService.getTopRateMovies();
    notifyListeners();
    return movies;
  }
}
