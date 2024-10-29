import 'package:dartz/dartz.dart';

import '../entity/popular_resp_entity.dart';
import '../repository/i_movie_repository.dart';

class PopularUc {
  IMovieRepository repository;

  PopularUc(this.repository);

  Future<Either<String, PopularRespEntity>> call() => repository.popular();
}
