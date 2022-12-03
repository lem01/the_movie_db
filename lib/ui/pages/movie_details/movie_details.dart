import 'package:flutter/material.dart';
import 'package:the_movie_db/domain/models/movie.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            FadeInImage(
                height: 450,
                placeholder: const AssetImage("assets/images/loading.gif"),
                image: NetworkImage(
                  movie.getImageHd(),
                )),
            SizedBox(
              height: 10,
            ),
            Text(movie.overview)
          ],
        ));
  }
}
