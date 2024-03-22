import 'package:minutes_app/api/category/category_api.dart';
import 'package:minutes_app/models/category_model.dart';
import 'package:minutes_app/repo/category/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo{
  final CategoryApi categoryApi ;
  CategoryRepoImpl(this.categoryApi);
  @override
  Future<List<CategoryModel>> getAllCategoryData() async {
    return await  categoryApi.getAllcategoryData();
  }

}