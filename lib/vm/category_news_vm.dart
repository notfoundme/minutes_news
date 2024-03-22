import 'package:flutter/foundation.dart';
import 'package:minutes_app/injections/news_injection.dart';
import 'package:minutes_app/models/category_model.dart';
import 'package:minutes_app/models/news_model.dart';
import 'package:minutes_app/repo/category/category_repo.dart';
import 'package:minutes_app/repo/news/news_repo.dart';

enum NewsState { initial, loading, loaded, error }

class CategoryNewsVm extends ChangeNotifier {
  NewsRepo newsRepo = getIt();
  int _offset = 0;
  bool _locked = false;

  NewsState _newsState = NewsState.initial;
  NewsState get newsState => _newsState;

  List<NewsModel> _listOfNewsModel = [];
  List<NewsModel> get listOfNewsModel => _listOfNewsModel;

  fetchAllNews(String currentCat) {
    _newsState = NewsState.loading;
    notifyListeners();
    newsRepo.getAllCategoryNewsFromApi(_offset, currentCat).then((value) {
      _listOfNewsModel.addAll(value);
      _newsState = NewsState.loaded;
      notifyListeners();
    }).catchError((e) {
      _newsState = NewsState.error;
      notifyListeners();
    });
  }

  fetchBasedOnOffset( String currentCat) {
    _offset += 15;
    if(_locked) {
      return;
    }
    newsRepo.getAllCategoryNewsFromApi(_offset, currentCat).then((value) {
      if(value.isEmpty) {
        _locked  = true;
      }
      // _locked = value.isEmpty;
      _listOfNewsModel.addAll(value);
      notifyListeners();
    }).catchError((e) {
      _newsState = NewsState.error;
      notifyListeners();
    });
  }

  void distroy() {
    _newsState = NewsState.initial;
  }
}

