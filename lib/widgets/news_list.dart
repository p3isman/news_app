import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/controllers/tabs_controller.dart';

import 'package:news_application/models/news_model.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.list, {this.hasController = true});

  final List<Article> list;
  final bool hasController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
      builder: (_) => ListView.separated(
        separatorBuilder: (context, i) => Divider(),
        controller: hasController ? _.scrollController : null,
        itemCount: list.length,
        itemBuilder: (context, i) {
          return _SingleNews(list[i], i);
        },
      ),
    );
  }
}

class _SingleNews extends StatelessWidget {
  const _SingleNews(this.news, this.index);

  final Article news;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        children: [
          Padding(
            padding:
                index == 0 ? const EdgeInsets.only(top: 10.0) : EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.02),
                  width: size.width * 0.6,
                  child: Text(
                    news.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 20.0,
                        icon: Icon(Icons.favorite_outline),
                        color: Colors.grey,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      IconButton(
                        iconSize: 20.0,
                        icon: Icon(Icons.share_outlined),
                        color: Colors.grey,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: size.width * 0.05),
            height: size.height * 0.1,
            width: size.width * 0.3,
            child: news.urlToImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/giphy.gif'),
                      image: NetworkImage(news.urlToImage!),
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/no-image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
