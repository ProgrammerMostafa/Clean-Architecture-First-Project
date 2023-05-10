import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_complete_app/core/error/failure.dart';
import 'package:flutter_clean_architecture_complete_app/core/usecase/base_usecase.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/entities/recommendations.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationsParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendations(parameters);
  }
}

class RecommendationsParameters extends Equatable {
  final int movieID;
  const RecommendationsParameters(this.movieID);
  @override
  List<Object?> get props => [];
}
