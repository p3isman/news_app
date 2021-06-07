import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService extends GetxController {
  final _authority = 'newsapi.org';
  final _path = '/v2/top-headlines';
  final _apiKey = 'dd483805494e4e119ee4408f658384aa';

  // Selected category
  String _selectedCategory = 'Business';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String category) {
    _selectedCategory = category;

    // Update news list
    this.getArticlesByCategory(category);

    update();
  }

  List<Article> headlines = [];

  Map<String, List<Article>> categoriesNews = {};

  List<Article> get getCurrentCategoryNews =>
      categoriesNews[_selectedCategory]!;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'Business'),
    Category(FontAwesomeIcons.medkit, 'Health'),
    Category(FontAwesomeIcons.vials, 'Science'),
    Category(FontAwesomeIcons.android, 'Technology'),
    Category(FontAwesomeIcons.ticketAlt, 'Entertainment'),
    Category(FontAwesomeIcons.footballBall, 'Sports'),
  ];

  void onInit() {
    this.getTopHeadlines();

    categories.forEach((element) {
      this.categoriesNews[element.name] = <Article>[];
    });

    this.getArticlesByCategory(_selectedCategory);

    super.onInit();
  }

  // Fill headlines list
  Future<void> getTopHeadlines() async {
    headlines = [];

    final url = Uri.https(
      _authority,
      _path,
      {
        'apiKey': _apiKey,
        'language': 'en',
      },
    );

    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    // Add news to list
    this.headlines.addAll(newsResponse.articles);

    update();
  }

  // Fill category list
  Future<void> getArticlesByCategory(String category) async {
    categoriesNews[category] = <Article>[];

    final url = Uri.https(
      _authority,
      _path,
      {
        'apiKey': _apiKey,
        'language': 'en',
        'category': category.toLowerCase(),
      },
    );

    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    this.categoriesNews[category]!.addAll(newsResponse.articles);

    update();
  }
}
