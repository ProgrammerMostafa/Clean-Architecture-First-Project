import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    List<Movie>? popularMovies,
    RequestState? popularState,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        popularMovies,
        popularState,
        topRatedMovies,
        topRatedState,
      ];
}
