import 'package:dio/dio.dart';
import 'package:test_task/services/custom_interceptors.dart';

class ApiEnvironment {
  static const String _baseUrl = "https://vue-study.skillbox.cc/api/";
  static String getApiURL() => _baseUrl;
}

class ApiContainer {
  final Dio _client;
  Dio get client => _client;

  static final ApiContainer _single = ApiContainer._initialize();
  factory ApiContainer() => _single;

  ApiContainer._initialize()
      : _client = Dio(BaseOptions(
          baseUrl: ApiEnvironment.getApiURL(),
          connectTimeout: 32000,
          receiveTimeout: 32000,
        )) {
    _client.options.headers['Accept'] = 'application/json';
    _client.interceptors.add(CustomInterceptors());
  }
}
