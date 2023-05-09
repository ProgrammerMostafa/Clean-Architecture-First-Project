import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_detail.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, int> {
  @override
  Future<Either<Failure, MovieDetail>> call(int parameters) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
