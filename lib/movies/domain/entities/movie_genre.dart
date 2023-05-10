import 'package:equatable/equatable.dart';

class MovieGenre extends Equatable {
  final int id;
  final String name;

  const MovieGenre({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
