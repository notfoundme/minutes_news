
import 'package:minutes_app/models/news_model.dart';

abstract class NewsApi {
  Future<List<NewsModel>> getAllNewsFromApi( int offset);
  Future<List<NewsModel>> getAllCategoryNewsFromApi(int offset,String cid);
}
 