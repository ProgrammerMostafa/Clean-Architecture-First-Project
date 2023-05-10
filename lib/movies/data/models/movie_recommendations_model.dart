import 'package:flutter_clean_architecture_complete_app/movies/domain/entities/recommendations.dart';

class MovieRecommendationsModel extends Recommendations {
  const MovieRecommendationsModel({
    required super.id,
    super.backdropPath,
  });

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) {
    return MovieRecommendationsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? '/nDxJJyA5giRhXx96q1sWbOUjMBI.jpg',
    );
  }
}
