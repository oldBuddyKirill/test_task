import 'package:dio/dio.dart';

import 'logger.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.log("""
==> Request
    URL: ${options.uri}
    Method: ${options.method}
    Query Parameters: ${options.queryParameters}
    Body: ${options.data}
    """);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.log("""
<== Response
    URL: ${response.realUri}
    Status Code: ${response.statusCode}
    Body: ${response.data}
    """);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      Logger.log("""
<== Response Error
    URL: ${err.response!.realUri}
    Status-Code: ${err.response!.statusCode}
    Body: ${err.response!.data}
    message: ${err.message}
    error: ${err.error}
""");
    } else {
      Logger.log("""
<== Response Error
    message: ${err.message}
    error: ${err.error}
""");
    }
    return super.onError(err, handler);
  }
}
