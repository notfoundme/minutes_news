import 'package:get_it/get_it.dart';
import 'package:minutes_app/api/category/category_api.dart';
import 'package:minutes_app/api/category/category_api_impl.dart';
import 'package:minutes_app/api/news/news_api.dart';
import 'package:minutes_app/api/news/news_api_impl.dart';
import 'package:minutes_app/repo/category/category_repo.dart';
import 'package:minutes_app/repo/category/category_repo_impl.dart';
import 'package:minutes_app/repo/news/news_repo.dart';
import 'package:minutes_app/repo/news/news_repo_impl.dart';
import 'package:minutes_app/vm/news_vm.dart';

final getIt = GetIt.instance;
void setup(){
   getIt.registerSingleton<NewsApi>(NewsApiImpl());
   getIt.registerSingleton<CategoryApi>(CategoryApiImpl());
   getIt.registerSingleton<NewsRepo>(NewsRepoImpl(getIt()));
   getIt.registerSingleton<CategoryRepo>(CategoryRepoImpl(getIt()));
   getIt.registerSingleton<NewsVm>( NewsVm());
}
