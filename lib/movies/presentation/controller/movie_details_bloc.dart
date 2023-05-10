import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/entities/movie_details.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/entities/recommendations.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_clean_architecture_complete_app/movies/domain/usecases/get_movie_recommendations_usecase.dart';

import '../../../core/utils/enums.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getMovieRecommendationsUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUseCase
        .call(MovieDetailsParameters(event.movieId));

    result.fold(
      (l) => emit(
        state.copyWith(movieDetailsState: RequestState.error),
      ),
      (r) {
        print('111111 ===> $r');
        emit(state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.success,
        ));
      },
    );
  }

  FutureOr<void> _getMovieRecommendations(
    GetMovieRecommendationsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieRecommendationsUseCase
        .call(RecommendationsParameters(event.movieId));

    result.fold(
      (l) => emit(
        state.copyWith(recommendationsState: RequestState.error),
      ),
      (r) {
        print('22222 ===> $r');
        emit(state.copyWith(
          recommendations: r,
          recommendationsState: RequestState.success,
        ));
      },
    );
  }
}
