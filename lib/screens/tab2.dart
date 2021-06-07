import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/services/news_service.dart';
import 'package:news_application/widgets/news_list.dart';

class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _CategoriesList(),
            Expanded(
              child: _CategoriesNews(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsService>(
      builder: (_) => Container(
        height: 100.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _.categories.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => _.selectedCategory = _.categories[i].name,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    _CategoryIcon(_.categories[i].icon, _.categories[i].name),
                    const SizedBox(height: 5.0),
                    Container(
                      child: Text(
                        _.categories[i].name,
                        style: TextStyle(
                            color: _.selectedCategory == _.categories[i].name
                                ? Colors.black
                                : Colors.grey.shade700,
                            fontWeight:
                                _.selectedCategory == _.categories[i].name
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon(
    this.icon,
    this.category, {
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsService>(
      builder: (_) => Container(
        width: 60.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _.selectedCategory == category
                ? Colors.pink.shade400
                : Colors.pink.shade100,
            width: 3.0,
          ),
        ),
        child: Icon(icon, color: Colors.grey.shade800),
      ),
    );
  }
}

class _CategoriesNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsService>(
      builder: (_) => _.categoriesNews[_.selectedCategory]!.length == 0
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              child: NewsList(
                _.getCurrentCategoryNews,
                hasController: false,
              ),
              onRefresh: () => _.getArticlesByCategory(_.selectedCategory),
            ),
    );
  }
}
