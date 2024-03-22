import 'package:flutter/material.dart';
import 'package:minutes_app/injections/news_injection.dart';
import 'package:minutes_app/models/news_model.dart';
import 'package:minutes_app/repo/news/news_repo.dart';

enum NewsState { initial, loading, loaded, error }

class NewsVm extends ChangeNotifier {
  NewsRepo newsRepo = getIt();
  int _offset = 0;
  bool _locked = false;

  NewsState _newsState = NewsState.initial;
  NewsState get newsState => _newsState;

  List<NewsModel> _listOfNewsModel = [];
  List<NewsModel> get listOfNewsModel => _listOfNewsModel;

  fetchAllNews() {
    _newsState = NewsState.loading;
    notifyListeners();
    newsRepo.getAllNewsFromApi(_offset).then((value) {
      _listOfNewsModel.addAll(value);
      _newsState = NewsState.loaded;
      notifyListeners();
    }).catchError((e) {
      _newsState = NewsState.error;
      notifyListeners();
    });
  }

  fetchBasedOnOffset() {
    _offset += 15;
    if(_locked) {
      return;
    }
    newsRepo.getAllNewsFromApi(_offset).then((value) {
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
}
