import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minutes_app/api/category/category_api.dart';
import 'package:minutes_app/models/category_model.dart';

class CategoryApiImpl implements CategoryApi {
  @override
  Future<List<CategoryModel>> getAllcategoryData() async {
    http.Response response =
        await http.get(Uri.parse("http://localhost:3000/categories"));
    List<Map<String, dynamic>> list =
        List<Map<String, dynamic>>.from(json.decode(response.body)["data"]);
    return list.map((item) {
      return CategoryModel.fromJson(item);
    }).toList();
  }
}
