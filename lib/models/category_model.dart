import 'package:flutter/foundation.dart';
import 'package:minutes_app/api/category/category_api.dart';

class CategoryModel{
  String title;
  String content;
  int id;

  CategoryModel({
    required this.content,
    required this.title,
    required this.id
  });

  factory CategoryModel.fromJson(Map<String,dynamic> json){
    return CategoryModel(content: json["content"], title: json["title"], id: json["id"]);
  } 

}