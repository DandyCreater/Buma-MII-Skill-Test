import 'package:dartz/dartz.dart';

import '../entity/movie_detail_resp_entity.dart';
import '../repository/i_movie_repository.dart';

class MovieDetailUc {
  final IMovieRepository repository;

  MovieDetailUc(this.repository);

  Future<Either<String, MovieDetailRespEntity>> call(String movieId) =>
      repository.movieDetail(movieId);
}
