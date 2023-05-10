import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/entities/recommendations.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/usecases/get_movie_recommendations_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
    MovieDetailsParameters parameters,
  );
  Future<Either<Failure, List<Recommendations>>> getMovieRecommendations(
    RecommendationsParameters parameters,
  );
}
