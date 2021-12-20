import 'package:dio/dio.dart';
import 'package:test_task/api/api.dart';

class ProductsApi {
  static const String _productsUrl = 'products';

  static Future<Response> getProducts(Map<String, dynamic> queryParameters) async {
    try {
      final response = await BaseApi.get(url: _productsUrl, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
