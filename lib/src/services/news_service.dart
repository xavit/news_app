import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';

const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = 'd7e1271ceff744749711d813eee4c2f2';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  final String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'enterntainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  NewsService() {
    getTopHeadlines();
  }

  get selectedCategory => _selectedCategory;

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
