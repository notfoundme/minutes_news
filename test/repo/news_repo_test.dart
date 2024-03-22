import 'package:flutter_test/flutter_test.dart';
import 'package:minutes_app/api/news/news_api_impl.dart';
import 'package:minutes_app/models/news_model.dart';
import 'package:minutes_app/repo/news/news_repo_impl.dart';

void main() {
  test('news repo test', () async {
    final newsRepo = NewsRepoImpl(NewsApiImpl());

    var x = await newsRepo.getAllNewsFromApi(0);
    print(x);
    expect(x.first.title,  "Sample News 1",);

  });
}