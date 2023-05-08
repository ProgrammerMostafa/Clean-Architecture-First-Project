import 'package:flutter_clean_architecture_complete_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import 'package:get_it/get_it.dart';

import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';

final getIt = GetIt.instance;

class ServiceLactor {
  void init() {
    getIt.registerLazySingleton<GetNowPlayingMoviesUsecase>(
      () => GetNowPlayingMoviesUsecase(getIt()),
    );

    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );

    getIt.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(getIt()),
    );
  }
}
