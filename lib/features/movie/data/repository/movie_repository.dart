import 'package:buma_mii_skill_test/features/movie/data/model/movie_detail_resp_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entity/movie_detail_resp_entity.dart';
import '../../domain/entity/now_playing_resp_entity.dart';
import '../../domain/entity/popular_resp_entity.dart';
import '../../domain/entity/upcoming_resp_entity.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../datasources/interfaces/i_movie_remote_datasources.dart';
import '../model/now_playing_resp_model.dart';
import '../model/popular_resp_model.dart';
import '../model/upcoming_resp_model.dart';

class MovieRepository extends IMovieRepository {
  IMovieRemoteDataSources remoteDataSources;

  MovieRepository(this.remoteDataSources);
  @override
  Future<Either<String, NowPlayingRespEntity>> nowPlaying() async {
    try {
      NowPlayingRespModel? result = await remoteDataSources.nowPlaying();
      if (result != null) {
        return right(result.toEntity());
      } else {
        return left("Data Now Playing Empty");
      }
    } catch (e) {
      return const Left("Something Wrong!");
    }
  }

  @override
  Future<Either<String, PopularRespEntity>> popular() async {
    try {
      PopularRespModel? result = await remoteDataSources.popular();
      if (result != null) {
        return right(result.toEntity());
      } else {
        return left("Data Popular Empty");
      }
    } catch (e) {
      return const Left("Something Wrong!");
    }
  }

  @override
  Future<Either<String, UpComingRespEntity>> upComing() async {
    try {
      UpComingRespModel? result = await remoteDataSources.upComing();
      if (result != null) {
        return right(result.toEntity());
      } else {
        return left("Data UpComing Empty");
      }
    } catch (e) {
      return const Left("Something Wrong!");
    }
  }

  @override
  Future<Either<String, MovieDetailRespEntity>> movieDetail(
      String movieId) async {
    try {
      MovieDetailRespModel? result =
          await remoteDataSources.movieDetail(movieId);
      if (result != null) {
        return right(result.toEntity());
      } else {
        return left("Movie Data Empty");
      }
    } catch (e) {
      return const Left("Something Wrong!");
    }
  }
}
