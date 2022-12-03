import 'package:the_movie_db/helper/constant.dart';
import 'package:the_movie_db/domain/models/movie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TheMovieDbService {
  static Future<List<Movie>> getTopRateMovies() async {
    var url = "${baseUrl}movie/top_rated?api_key=$apiKey&language=$language";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final topRateMovies = Movies.fromJsonList(jsonResponse["results"]);
      return topRateMovies;
    }

    return <Movie>[];
  }
}

class Movies {
  Movies();
  static List<Movie> fromJsonList(List<dynamic> jsonList) {
    List<Movie> listmovies = [];
    if (jsonList.isNotEmpty) {
      for (var pelicula in jsonList) {
        //transforma el jsonList a un objeto y lo agrega a listmovies
        final movie = Movie.fromJson(pelicula);
        listmovies.add(movie);
      }
    }
    return listmovies;
  }
}
