import 'package:minutes_app/models/category_model.dart';

abstract class CategoryApi{
  Future<List<CategoryModel>> getAllcategoryData();
}