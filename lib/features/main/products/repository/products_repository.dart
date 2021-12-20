import 'package:test_task/features/main/products/api/products_api.dart';
import 'package:test_task/features/main/products/models/product_model.dart';
import 'package:test_task/services/logger.dart';

class ProductsRepository {
  static bool isLastPage = true;
  static Future getProducts(int categoryId, int page) async {
    final _query = {'categoryId': categoryId, 'page': page};
    try {
      final temp = await ProductsApi.getProducts(_query);
      final _json = temp.data;
      if (temp.statusCode == 200) {
        print('page == ${_json['pagination']['page']}, pages = ${_json['pagination']['pages']}');
        isLastPage = _json['pagination']['page'] == _json['pagination']['pages'];
        return ProductModel.fromJsonArray(_json['items']);
      }
      throw temp;
    } catch (e, s) {
      Logger.log('ProductsRepository Error: $e. Stack: $s');
    }
  }
}
