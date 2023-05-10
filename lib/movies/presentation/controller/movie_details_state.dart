part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;

  final List<Recommendations> recommendations;
  final RequestState recommendationsState;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.recommendations = const [],
    this.recommendationsState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    List<Recommendations>? recommendations,
    RequestState? recommendationsState,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendations: recommendations ?? this.recommendations,
      recommendationsState: recommendationsState ?? this.recommendationsState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        recommendations,
        recommendationsState,
      ];
}
