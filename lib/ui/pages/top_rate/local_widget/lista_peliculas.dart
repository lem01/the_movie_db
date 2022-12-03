import 'package:flutter/material.dart';
import 'package:the_movie_db/domain/models/movie.dart';
import 'package:the_movie_db/ui/pages/movie_details/movie_details.dart';

class ListaPeliculas extends StatelessWidget {
  final Movie movie;

  const ListaPeliculas({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title),
      subtitle: Text("${movie.voteAverage} (${movie.voteCount})"),
      trailing: Image.network(movie.getImage()),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(movie: movie)));
      },
    );
  }
}
