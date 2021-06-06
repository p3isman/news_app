import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/services/news_service.dart';

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _CategoriesList(),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsService>(
      builder: (_) => Container(
        height: 81.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _.categories.length,
          itemBuilder: (context, i) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _CategoryIcon(_.categories[i].icon),
                  const SizedBox(height: 5.0),
                  Container(
                    child: Text(
                      _.categories[i].name,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
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
    this.icon, {
    Key? key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.pink.shade200,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.pink.shade100,
          width: 3.0,
        ),
      ),
      child: Icon(icon),
    );
  }
}
