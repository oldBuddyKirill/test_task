import 'package:dio/dio.dart';
import 'package:test_task/api/api.dart';

class CategoriesApi {
  static const String _categoriesUrl = 'productCategories';

  static Future<Response> getCategories() async {
    try {
      final response = await BaseApi.get(url: _categoriesUrl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
