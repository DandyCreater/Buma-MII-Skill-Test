import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../helper/constanta_string.dart';

enum RequestMethods { get, post, put, delete, patch }

class ApiController {
  Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(minutes: 5),
    sendTimeout: const Duration(minutes: 5),
    receiveTimeout: const Duration(minutes: 5),
  ));

  Future request({
    RequestMethods method = RequestMethods.post,
    dynamic params,
    String bearerToken = "",
    String features = "",
  }) async {
    Response? response;

    try {
      switch (method) {
        case RequestMethods.get:
          response = await dio.get(AppConstanta.baseUrl + features,
              options: Options(
                headers: AppConstanta.header(bearerToken),
                receiveDataWhenStatusError: true,
                validateStatus: (status) => true,
              ));
          break;
        case RequestMethods.post:
          response = await dio.post(AppConstanta.baseUrl,
              data: params,
              options: Options(
                  headers: AppConstanta.header(bearerToken),
                  receiveDataWhenStatusError: true));

          break;
        case RequestMethods.put:
          response = await dio.put(AppConstanta.baseUrl,
              data: params,
              options: Options(
                  headers: AppConstanta.header(bearerToken),
                  receiveDataWhenStatusError: true));
          break;
        case RequestMethods.delete:
          response = await dio.delete(
            AppConstanta.baseUrl,
            options: Options(
                headers: AppConstanta.header(bearerToken),
                receiveDataWhenStatusError: true),
          );
          break;
        case RequestMethods.patch:
          response = await dio.patch(AppConstanta.baseUrl);
          break;
      }

      if (response.statusMessage == "OK") {
        debugPrint("response ${response.data}");
        return response.data;
      } else {
        return response;
      }
    } on DioError catch (err) {
      return err.response?.data ?? "";
    }
  }
}
