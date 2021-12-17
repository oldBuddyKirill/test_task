import 'package:dio/dio.dart';
import 'package:test_task/api/api_container.dart';

class BaseApi {
  static Dio get _client => ApiContainer().client;

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _client.request(
        url,
        queryParameters: queryParameters,
        options: Options(method: 'GET'),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
