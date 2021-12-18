import 'package:test_task/features/main/products/api/products_api.dart';
import 'package:test_task/features/main/products/models/product_model.dart';
import 'package:test_task/services/logger.dart';

class ProductsRepository {
  static Future getProducts (int id) async {
    try{
      final temp = await ProductsApi.getProducts(id);
      final _json = temp.data;
      if (temp.statusCode == 200) return ProductModel.fromJsonArray(_json['items']);
      throw temp;
    } catch (e,s){
      Logger.log('ProductsRepository Error: $e. Stack: $s');
    }
  }
}