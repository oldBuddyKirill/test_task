import 'package:test_task/features/main/categories/api/categories_api.dart';
import 'package:test_task/features/main/categories/models/categories_model.dart';
import 'package:test_task/services/logger.dart';

class CategoriesRepository {
  static Future getCategories () async {
    try{
      final temp = await CategoriesApi.getCategories();
      final _json = temp.data;
      if (temp.statusCode == 200) return CategoriesModel.fromJsonArray(_json['items']);
      throw temp;
    } catch (e,s){
      Logger.log('CategoriesRepository Error: $e. Stack: $s');
      //throw SnackBarService(message: 'Не удалось загрузить расписание'); // todo complete
    }
  }
}