import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        genreIds: List<int>.from((json['genre_ids'] as List).map((e) => e)),
      );
}
