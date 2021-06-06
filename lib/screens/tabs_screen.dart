import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_application/controllers/tabs_controller.dart';
import 'package:news_application/screens/tab1.dart';
import 'package:news_application/screens/tab2.dart';
import 'package:news_application/theme/theme.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        actions: [
          Obx(
            () => IconButton(
                icon: theme.value == 'light'
                    ? Icon(Icons.nights_stay)
                    : Icon(Icons.wb_sunny),
                onPressed: () => changeTheme()),
          )
        ],
      ),
      body: _PageView(),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
      builder: (_) => PageView(
        controller: _.pageController,
        onPageChanged: (i) => _.bottomBarIndex = i,
        physics: BouncingScrollPhysics(),
        children: [
          Tab1(),
          Tab2(),
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
      builder: (_) => BottomNavigationBar(
          onTap: (i) {
            if (i == 0 && _.bottomBarIndex == 0)
              _.scrollController.animateTo(0.0,
                  duration: Duration(milliseconds: 200), curve: Curves.easeOut);

            _.bottomBarIndex = i;
          },
          currentIndex: _.bottomBarIndex,
          selectedFontSize: 13.0,
          unselectedFontSize: 13.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Para ti',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explorar',
            ),
          ]),
    );
  }
}
