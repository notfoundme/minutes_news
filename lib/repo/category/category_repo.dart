import 'package:minutes_app/models/category_model.dart';

abstract class CategoryRepo{
  Future<List<CategoryModel>> getAllCategoryData();
}