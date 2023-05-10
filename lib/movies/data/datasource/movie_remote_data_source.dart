import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_complete_app/movies/data/models/movie_details_model.dart';
import 'package:flutter_clean_architecture_complete_app/movies/data/models/movie_recommendations_model.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/usecases/get_movie_recommendations_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constant.dart';
import '../../../core/network/error_message_model.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(
    RecommendationsParameters parameters,
  );
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(APIConstant.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(APIConstant.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(APIConstant.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(APIConstant.movieDetailsPath(parameters.movieID));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(
      RecommendationsParameters parameters) async {
    final response =
        await Dio().get(APIConstant.recommendationsPath(parameters.movieID));

    if (response.statusCode == 200) {
      return List<MovieRecommendationsModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieRecommendationsModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
