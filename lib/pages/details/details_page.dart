import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/details/widgets/details_movie.dart';
import 'package:movie_app/pages/home/widgets/movies_horizontal_list.dart';
import 'package:movie_app/services/api_services.dart';

class DetailsPage extends StatefulWidget {
  final int movieId;
  const DetailsPage({super.key, required this.movieId, required movie});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ApiServices apiServices = ApiServices();

  late Future<Movie> movieDetails; //Detalhes
  late Future<Result> similarMovies; // Similares
  late Future<Result> recommendationsMovies; // Recomendações

  @override
  void initState() {
    movieDetails = apiServices.getMovieDetails(widget.movieId); // Detalhes
    similarMovies = apiServices.getSimilarMovies(widget.movieId); // Similares
    recommendationsMovies =
        apiServices.getRecomendationsMovies(widget.movieId); // Recomendações

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Detalhes do Filme',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
            ),
            FutureBuilder<Movie>(
              future: movieDetails,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (snapshot.hasData) {
                  return DetailsMovie(movie: snapshot.data!);
                }
                return const Center(
                  child: Text('No data found'),
                );
              },
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Filmes Similares',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
            ),
            FutureBuilder<Result>(
              future: similarMovies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (snapshot.hasData) {
                  return MoviesHorizontalList(movies: snapshot.data!.movies);
                }
                return const Center(
                  child: Text('No data found'),
                );
              },
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Filmes Recomendados',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
            ),
            FutureBuilder<Result>(
              future: recommendationsMovies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (snapshot.hasData) {
                  return MoviesHorizontalList(movies: snapshot.data!.movies);
                }
                return const Center(
                  child: Text('No data found'),
                );
              },
            ),
          ], //children
        ),
      ),
    );
  }
}
