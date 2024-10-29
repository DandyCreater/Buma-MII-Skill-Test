import 'package:flutter/material.dart';

import '../../../../cores/helper/constanta_string.dart';
import '../../../../cores/services/api_controller.dart';
import '../model/movie_detail_resp_model.dart';
import '../model/now_playing_resp_model.dart';
import '../model/popular_resp_model.dart';
import '../model/upcoming_resp_model.dart';
import 'interfaces/i_movie_remote_datasources.dart';

class MovieRemoteDataSources implements IMovieRemoteDataSources {
  @override
  Future<NowPlayingRespModel?> nowPlaying() async {
    ApiController apiController = ApiController();
    try {
      final result = await apiController.request(
        method: RequestMethods.get,
        bearerToken: AppConstanta.bearerToken,
        features: "now_playing",
      );
      if (result != null) {
        return NowPlayingRespModel.fromJson(result);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("error $e");
      return null;
    }
  }

  @override
  Future<PopularRespModel?> popular() async {
    ApiController apiController = ApiController();
    try {
      final result = await apiController.request(
        method: RequestMethods.get,
        bearerToken: AppConstanta.bearerToken,
        features: "popular",
      );
      if (result != null) {
        return PopularRespModel.fromJson(result);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("error $e");
      return null;
    }
  }

  @override
  Future<UpComingRespModel?> upComing() async {
    ApiController apiController = ApiController();
    try {
      final result = await apiController.request(
        method: RequestMethods.get,
        bearerToken: AppConstanta.bearerToken,
        features: "upcoming",
      );
      if (result != null) {
        return UpComingRespModel.fromJson(result);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("error $e");
      return null;
    }
  }

  @override
  Future<MovieDetailRespModel?> movieDetail(String movieId) async {
    ApiController apiController = ApiController();
    debugPrint("movie Id $movieId");
    try {
      final result = await apiController.request(
        method: RequestMethods.get,
        bearerToken: AppConstanta.bearerToken,
        features: movieId,
      );
      if (result != null) {
        return MovieDetailRespModel.fromJson(result);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("error datasources $e");
      return null;
    }
  }
}
