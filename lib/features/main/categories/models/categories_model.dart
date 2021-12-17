class CategoriesModel {
  int id;
  String title;
  String slug;

  CategoriesModel({required this.id, required this.title, required this.slug});

  CategoriesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        slug = json['slug'];

  static List<CategoriesModel> fromJsonArray (List<dynamic> json){
    final List<CategoriesModel> result = [];
    for (var item in json) {
      result.add(CategoriesModel.fromJson(item));
    }
    return result;
  }
}
