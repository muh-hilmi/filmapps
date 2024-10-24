class Movie {
  final int id;
  final String title;
  final String overview;
  final double vote;
  final String? posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.vote,
    this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['original_title'],
      overview: json['overview'],
      vote: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
    );
  }
}
