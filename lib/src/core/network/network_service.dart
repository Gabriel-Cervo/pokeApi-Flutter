import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeapi/src/core/helpers/helper.dart';
import 'package:pokeapi/src/core/network/interceptors/logger.interceptor.dart';
import 'package:pokeapi/src/core/utils/constants/network_constants.dart';
import 'package:pokeapi/src/core/utils/logs/logger.dart';

class DioNetwork {
  static late Dio appAPI;
  static late Dio retryAPI;

  static void initDio() {
    appAPI = Dio(baseOptions(baseApiUrl));
    appAPI.interceptors.add(LoggerInterceptor(logger));
    appAPI.interceptors.add(appQueuedInterceptorsWrapper());

    retryAPI = Dio(baseOptions(baseApiUrl));
    retryAPI.interceptors.add(LoggerInterceptor(logger));
    retryAPI.interceptors.add(interceptorsWrapper());
  }

  static QueuedInterceptorsWrapper appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = Helper.getDioHeaders();

        if (kDebugMode) {
          print("Headers");
          print(json.encode(headers));
        }

        options.headers = headers;
        appAPI.options.headers = headers;

        return r.next(options);
      },
      onError: (error, handler) async {
        try {
          return handler.next(error);
        } catch (_) {
          return handler.reject(error);
        }
      },
      onResponse: (Response<dynamic> response,
          ResponseInterceptorHandler handler) async {
        return handler.next(response);
      },
    );
  }

  static InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = Helper.getDioHeaders();

        options.headers = headers;
        appAPI.options.headers = headers;

        return r.next(options);
      },
      onResponse: (response, handler) async {
        if ("${(response.data["code"] ?? "0")}" != "0") {
          return handler.resolve(response);
        }

        return handler.next(response);
      },
      onError: (error, handler) {
        try {
          return handler.next(error);
        } catch (_) {
          return handler.reject(error);
        }
      },
    );
  }

  static BaseOptions baseOptions(String url) {
    Map<String, dynamic> headers = Helper.getDioHeaders();

    return BaseOptions(
        baseUrl: url,
        validateStatus: (s) => s! < 300,
        headers: headers..removeWhere((key, value) => value == null),
        responseType: ResponseType.json);
  }
}
