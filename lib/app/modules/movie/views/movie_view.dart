// lib/views/movies_list_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';

class MovieView extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Popular Movies',
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.redAccent),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: movieController.movies.length,
          itemBuilder: (context, index) {
            final movie = movieController.movies[index];
            return ListTile(
              title: Text(
                '⭐${movie.vote} | ${movie.title}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              subtitle: Text(
                movie.overview,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: movie.posterPath != null
                  ? Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}')
                  : null,
              minVerticalPadding: 10,
            );
          },
        );
      }),
    );
  }
}
