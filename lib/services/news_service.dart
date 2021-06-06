import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService extends GetxController {
  final _authority = 'newsapi.org';
  final _path = '/v2/top-headlines';
  final _apiKey = 'dd483805494e4e119ee4408f658384aa';

  RxList headlines = [].obs;

  List<Category> categories = [
    Category(FontAwesomeIcons.globe, 'General'),
    Category(FontAwesomeIcons.bitcoin, 'Business'),
    Category(FontAwesomeIcons.medkit, 'Health'),
    Category(FontAwesomeIcons.vials, 'Science'),
    Category(FontAwesomeIcons.android, 'Technology'),
    Category(FontAwesomeIcons.ticketAlt, 'Entertainment'),
    Category(FontAwesomeIcons.footballBall, 'Sports'),
  ];

  void onInit() {
    this.getTopHeadlines();
    super.onInit();
  }

  // Fill headlines list
  Future<void> getTopHeadlines() async {
    headlines.value = [];

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
}
