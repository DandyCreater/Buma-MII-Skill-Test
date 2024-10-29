import '../../model/movie_detail_resp_model.dart';
import '../../model/now_playing_resp_model.dart';
import '../../model/popular_resp_model.dart';
import '../../model/upcoming_resp_model.dart';

abstract class IMovieRemoteDataSources {
  Future<NowPlayingRespModel?> nowPlaying();
  Future<PopularRespModel?> popular();
  Future<UpComingRespModel?> upComing();
  Future<MovieDetailRespModel?> movieDetail(String movieId);
}
