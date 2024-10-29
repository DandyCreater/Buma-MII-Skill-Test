import 'package:dartz/dartz.dart';

import '../entity/movie_detail_resp_entity.dart';
import '../entity/now_playing_resp_entity.dart';
import '../entity/popular_resp_entity.dart';
import '../entity/upcoming_resp_entity.dart';

abstract class IMovieRepository {
  Future<Either<String, NowPlayingRespEntity>> nowPlaying();
  Future<Either<String, PopularRespEntity>> popular();
  Future<Either<String, UpComingRespEntity>> upComing();
  Future<Either<String, MovieDetailRespEntity>> movieDetail(String movieId);
}
