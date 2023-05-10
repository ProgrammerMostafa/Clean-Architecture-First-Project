import 'package:flutter_clean_architecture_complete_app/movies/domain/entities/movie_genre.dart';

class MovieGenreModel extends MovieGenre {
  const MovieGenreModel({required super.id, required super.name});
  
  factory MovieGenreModel.fromJson(Map<String, dynamic> json) {
    return MovieGenreModel(id: json['id'], name: json['name']);
  }
}
