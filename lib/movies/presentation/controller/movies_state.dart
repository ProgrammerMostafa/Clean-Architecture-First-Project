import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object?> get props => [];
}

class InitialState extends MoviesState {
  final String data;

  const InitialState({this.data = ''});
}
