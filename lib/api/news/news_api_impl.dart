import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minutes_app/api/news/news_api.dart';
import 'package:minutes_app/models/news_model.dart';

class NewsApiImpl implements NewsApi {
  @override
  Future<List<NewsModel>> getAllNewsFromApi(int offset) async {
    print("I am here ");
    http.Response response = await http.get(Uri.parse("http://localhost:3000/news/${offset}"));
    List<Map<String, dynamic>> list =
        List<Map<String, dynamic>>.from(json.decode(response.body)["data"]);
    return list.map((item) {
      return NewsModel.fromJson(item);
    }).toList();
  }

  @override
  Future<List<NewsModel>> getAllCategoryNewsFromApi(int offset,String cid) async {
    http.Response response = await http.get(Uri.parse("http://localhost:3000/category/$cid/$offset"));
    List<Map<String, dynamic>> list =
        List<Map<String, dynamic>>.from(json.decode(response.body)["data"]);
    print(list);
    return list.map((item) {
      return NewsModel.fromJson(item);
    }).toList();
  }
}
