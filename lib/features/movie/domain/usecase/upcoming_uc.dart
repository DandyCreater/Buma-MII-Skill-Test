import 'package:dartz/dartz.dart';

import '../entity/upcoming_resp_entity.dart';
import '../repository/i_movie_repository.dart';

class UpComingUc {
  IMovieRepository repository;

  UpComingUc(this.repository);

  Future<Either<String, UpComingRespEntity>> call() => repository.upComing();
}
