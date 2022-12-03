import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/services/the_movie_db_service.dart';
import 'package:the_movie_db/ui/global_widgets/loading.dart';
import 'package:the_movie_db/ui/pages/top_rate/local_widget/lista_peliculas.dart';
import 'package:the_movie_db/ui/pages/top_rate/provider/top_rate_provider.dart';

class TopRate extends StatefulWidget {
  const TopRate({super.key});

  @override
  State<TopRate> createState() => _TopRateState();
}

class _TopRateState extends State<TopRate> {
  @override
  Widget build(BuildContext context) {
    final obtenerPeliculas = Provider.of<TopRateProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Películas mejor valoradas")),
        body: RefreshIndicator(
          onRefresh: (() {
            return TheMovieDbService.getTopRateMovies();
          }),
          child: FutureBuilder(
            //podría poner
            //initialData: [],
            future: obtenerPeliculas.getTopMoves(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var pelicula = snapshot.data![index];
                    return ListaPeliculas(movie: pelicula);
                  },
                );
              } else {
                return const Loading();
              }
            },
          ),
        ));
  }
}
