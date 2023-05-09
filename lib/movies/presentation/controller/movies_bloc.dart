import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  static MoviesBloc get(context) => BlocProvider.of<MoviesBloc>(context);

  Future<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(nowPlayingState: RequestState.error)),
      (r) => emit(
        state.copyWith(
          nowPlayingState: RequestState.success,
          nowPlayingMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularMoviesUsecase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(popularState: RequestState.error)),
      (r) => emit(
        state.copyWith(
          popularState: RequestState.success,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(topRatedState: RequestState.error)),
      (r) => emit(
        state.copyWith(
          topRatedState: RequestState.success,
          topRatedMovies: r,
        ),
      ),
    );
  }
}
