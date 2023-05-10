import 'package:flutter_clean_architecture_complete_app/movies/data/models/movie_genre_model.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.runtime,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      runtime: json['runtime'],
      genres: List<MovieGenreModel>.from(
        (json['genres'] as List).map((e) => MovieGenreModel.fromJson(e)),
      ),
    );
  }
}
