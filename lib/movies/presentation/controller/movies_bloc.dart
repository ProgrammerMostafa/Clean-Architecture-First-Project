import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';

import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;

  MoviesBloc(this.getNowPlayingMoviesUsecase) : super(const InitialState()) {
    print('Tmamaaa ya 7mada');
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUsecase.execute();
      print('a7a');
      result.fold((l) => null, (r) => print(r));

      emit(InitialState(data: 'mostafa'));
    });
  }

  static MoviesBloc get(context) => BlocProvider.of<MoviesBloc>(context);
}
