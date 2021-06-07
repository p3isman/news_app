import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  var scrollPosition = 0.0;
  final ScrollController scrollController = new ScrollController();

  var _bottomBarIndex = 0;
  final PageController _pageController = new PageController();

  int get bottomBarIndex => _bottomBarIndex;
  PageController get pageController => _pageController;

  set bottomBarIndex(int i) {
    _bottomBarIndex = i;

    // Change PageView
    pageController.animateToPage(
      i,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    update();
  }

  void goTop() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 200), curve: Curves.easeOut);
  }
}
