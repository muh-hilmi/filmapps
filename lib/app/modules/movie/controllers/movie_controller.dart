// lib/controllers/movie_controller.dart
import 'dart:convert';
import 'package:filmapps/app/data/movie.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MovieController extends GetxController {
  var movies = <Movie>[].obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=1b709e9b59ff161d1fb4776a1b5a7565'));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      var movieResults = jsonData['results'] as List<dynamic>;

      // Ubah List<dynamic> ke List<Movie>
      movies.value =
          movieResults.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
