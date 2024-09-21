import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/movie_model.dart';

const baseUrl = 'https://api.themoviedb.org/3/';

const key = '?api_key=$apiKey';


class ApiServices {

    Future<Result> getTopRatedMovies() async {
    const endpoint = 'movie/top_rated';
    final url = Uri.parse("$baseUrl$endpoint$key");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = Result.fromJson(json);
      return result;
    }
    throw Exception("Ocorreu um erro");
  }


    Future<Result> getNowPlayingMovies() async {
    const endpoint = 'movie/now_playing';
    final url = Uri.parse("$baseUrl$endpoint$key");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = Result.fromJson(json);
      return result;
    }
    throw Exception("Ocorreu um erro");
  }

      Future<Result> getPopularMovies() async {
    const endpoint = 'movie/popular';
    final url = Uri.parse("$baseUrl$endpoint$key");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = Result.fromJson(json);
      return result;
    }
    throw Exception("Ocorreu um erro");
  }

      Future<Result> getUpcomingMovies() async {
    const endpoint = 'movie/upcoming';
    final url = Uri.parse("$baseUrl$endpoint$key");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = Result.fromJson(json);
      return result;
    }
    throw Exception("Ocorreu um erro");
  }


  
    ///
    

   
Future<Movie> getMovieDetails(int movieId) async {
  final endpoint = 'movie/$movieId';

  final url = Uri.parse("$baseUrl$endpoint$key");
  final response = await http.get(url);

  if (response.statusCode == 200) {

    final json = jsonDecode(response.body);   
    final movie = Movie.fromJson(json);
   
    return movie; 
  }

  throw Exception("Erro ao carregar detalhes do filme");
}



Future<Result> getRecomendationsMovies(int movieId) async {
  final endpoint = 'movie/$movieId/recommendations';

  final url = Uri.parse("$baseUrl$endpoint$key");
  final response = await http.get(url);

  if (response.statusCode == 200) {

    final json = jsonDecode(response.body);
    final result = Result.fromJson(json);
      
    return result;
  }
 
  throw Exception("Erro ao carregar recomendações");
}


Future<Result> getSimilarMovies(int movieId) async {
  final endpoint = 'movie/$movieId/similar';

  final url = Uri.parse("$baseUrl$endpoint$key");
  final response = await http.get(url);

  if (response.statusCode == 200) {

    final json = jsonDecode(response.body);
    final result = Result.fromJson(json);
      
    return result;
  }
 
  throw Exception("Erro ao carregar filmes similares");
}


}
