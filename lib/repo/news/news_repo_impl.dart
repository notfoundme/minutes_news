import 'package:minutes_app/api/news/news_api.dart';
import 'package:minutes_app/models/news_model.dart';
import 'package:minutes_app/repo/news/news_repo.dart';

class NewsRepoImpl implements NewsRepo{
 final NewsApi newsApi; 
  NewsRepoImpl(this.newsApi);

  @override
  Future<List<NewsModel>> getAllNewsFromApi(int offset) async {
   return await newsApi.getAllNewsFromApi(offset);
  }
  
  @override
  Future<List<NewsModel>> getAllCategoryNewsFromApi(int offset, String cid) async {
   return await newsApi.getAllCategoryNewsFromApi(offset, cid);
    
  }
}