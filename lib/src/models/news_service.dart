import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/src/models/news_models.dart';

const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = 'd7e1271ceff744749711d813eee4c2f2';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    print("Cargando headlines...");

    final url =
        Uri.parse("$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us");

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles as Iterable<Article>);
    notifyListeners();
  }
}
