import 'package:dartz/dartz.dart';

import '../entity/now_playing_resp_entity.dart';
import '../repository/i_movie_repository.dart';

class NowPlayingUc {
  final IMovieRepository repository;

  NowPlayingUc(this.repository);

  Future<Either<String, NowPlayingRespEntity>> call() =>
      repository.nowPlaying();
}
