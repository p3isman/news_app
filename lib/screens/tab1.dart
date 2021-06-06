import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_application/services/news_service.dart';
import 'package:news_application/widgets/news_list.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetBuilder<NewsService>(
      builder: (_) => Scaffold(
        body: _.headlines.length == 0
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                child: NewsList(_.headlines),
                onRefresh: () => _.getTopHeadlines(),
              ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
