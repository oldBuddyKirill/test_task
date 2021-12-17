import 'package:test_task/features/main/products/models/product_colors_model.dart';

class ProductModel {
  int id;
  String title;
  String slug;
  String imageUrl;
  int price;
  List<Colors> colors;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.imageUrl,
    required this.price,
    required this.colors,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        slug = json['slug'],
        imageUrl = json['image']['file']['url'],
        price = json['price'],
        colors = json['colors'];

  static List<ProductModel> fromJsonArray (List<dynamic> json){
    final List<ProductModel> result = [];
    for (var item in json) {
      result.add(ProductModel.fromJson(item));
    }
    return result;
  }
}

