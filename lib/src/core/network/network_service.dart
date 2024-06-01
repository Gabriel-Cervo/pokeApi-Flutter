import 'package:dio/dio.dart';
import 'package:pokeapi/src/core/helpers/helper.dart';
import 'package:pokeapi/src/core/network/interceptors/logger.interceptor.dart';
import 'package:pokeapi/src/core/utils/constants/network_constants.dart';
import 'package:pokeapi/src/core/utils/logs/logger.dart';

class DioNetwork {
  static late Dio appAPI;
  static late Dio retryAPI;

  static void initDio() {
    appAPI = Dio(baseOptions(NetworkConstants.baseApiUrl));
    appAPI.interceptors.add(LoggerInterceptor(logger));
    appAPI.interceptors.add(appQueuedInterceptorsWrapper());
  }

  static QueuedInterceptorsWrapper appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = Helper.getDioHeaders();

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

  static BaseOptions baseOptions(String url) {
    Map<String, dynamic> headers = Helper.getDioHeaders();

    return BaseOptions(
        baseUrl: url,
        validateStatus: (s) => s! < 300,
        headers: headers..removeWhere((key, value) => value == null),
        responseType: ResponseType.json);
  }
}
