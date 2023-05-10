import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/entities/movie_genre.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int runtime;
  final List<MovieGenre> genres;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.runtime,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        overview,
        releaseDate,
        voteAverage,
        runtime,
        genres,
      ];
}
