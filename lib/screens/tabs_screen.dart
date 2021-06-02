import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}
