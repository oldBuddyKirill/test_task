import 'package:dio/dio.dart';
import 'package:test_task/api/api.dart';

class ProductsApi {
  static const String _productsUrl = 'products';

  static Future<Response> getProducts (int id) async {
    try{
      final response = await BaseApi.get(url: _productsUrl, queryParameters: {'id' : id});
      return response;
    } catch (e) {
      rethrow;
    }
}
}