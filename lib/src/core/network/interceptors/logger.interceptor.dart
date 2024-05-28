import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor(
    this.logger, {
    this.shouldPrintRequestData = true,
    this.shouldPrintRequestHeader = true,
    this.shouldPrintRequestBody = true,
    this.shouldPrintResponseHeader = true,
    this.shouldPrintResponseBody = true,
    this.shouldPrintError = true,
  });

  final Logger logger;

  bool shouldPrintRequestData;
  bool shouldPrintRequestHeader;
  bool shouldPrintRequestBody;
  bool shouldPrintResponseBody;
  bool shouldPrintResponseHeader;
  bool shouldPrintError;

  @override
  Future onRequest(RequestOptions options, handler) async {
    _logText('--- Request ---');
    _logKeyValue('uri', options.uri);

    if (shouldPrintRequestData) {
      _logKeyValue('method', options.method);
      _logKeyValue('responseType', options.responseType.toString());
      _logKeyValue('connectTimeout', options.connectTimeout?.inSeconds ?? 0);
      _logKeyValue('receiveTimeout', options.receiveTimeout?.inSeconds ?? 0);
      _logKeyValue('extra', options.extra);
    }

    if (shouldPrintRequestHeader) {
      _logText('headers:');
      options.headers.forEach((key, v) => _logKeyValue(' $key', v));
    }

    if (shouldPrintRequestBody) {
      _logText('data:');
      _logData(options.data);
    }

    _logText('');
    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, handler) async {
    if (shouldPrintError) {
      _logKeyValueError("", '--- DioError ---');
      _logKeyValueError("", 'uri: ${err.requestOptions.uri}');
      _logKeyValueError("", '$err');

      if (err.response != null) {
        _logResponse(err.response!);
      }

      _logText('');
    }

    return super.onError(err, handler);
  }

  @override
  Future onResponse(Response response, handler) async {
    _logText('--- Response ---');
    _logResponse(response);

    return super.onResponse(response, handler);
  }

  void _logResponse(Response response) {
    _logKeyValue('uri', response.requestOptions.uri);

    if (shouldPrintResponseHeader) {
      _logKeyValue('statusCode', response.statusCode ?? 0);

      if (response.isRedirect == true) {
        _logKeyValue('redirect', response.realUri);
      }

      _logText('headers:');
      
      response.headers.forEach((key, v) => _logKeyValue(' $key', v.join(',')));
    }

    if (shouldPrintResponseBody) {
      _logText('Response Text:');
      _logData(response.toString());
    }

    _logText('');
  }

  void _logKeyValue(String key, Object v) {
    _logText('$key: $v');
  }

  void _logKeyValueError(String key, Object v) {
    logger.severe('$key: $v');
  }

  void _logData(msg) {
    msg.toString().split('\n').forEach(_logText);
  }

  void _logText(String text) {
    logger.info(text);
  }
}
