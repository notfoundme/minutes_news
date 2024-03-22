import 'package:flutter/foundation.dart';
import 'package:minutes_app/injections/news_injection.dart';
import 'package:minutes_app/models/category_model.dart';
import 'package:minutes_app/repo/category/category_repo.dart';

enum CategoryState { initial, loading, loaded, error }

class CategoryVm extends ChangeNotifier {
  CategoryRepo categoryRepo = getIt();

  CategoryState _categoryState = CategoryState.initial;
  CategoryState get categoryState => _categoryState;

  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  fetchCategory() {
    _categoryState = CategoryState.loading;
    notifyListeners();
    categoryRepo.getAllCategoryData().then((value) {
      _categoryList.clear();
      _categoryList.addAll(value);
      _categoryState = CategoryState.loaded;
      notifyListeners();
    }).catchError((e) {
    print (e);
      _categoryState = CategoryState.error;
      notifyListeners();
    });
  }
}
