import 'package:get_it/get_it.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServiceLactor {
  void init() {
    //// Bloc
    getIt.registerLazySingleton(() => MoviesBloc(getIt(), getIt(), getIt()));

    //// Use Cases
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUsecase(getIt()));

    //// Data Source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );

    //// Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(getIt()),
    );
  }
}
