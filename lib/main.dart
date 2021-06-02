import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_application/screens/tabs_screen.dart';
import 'package:news_application/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: TabsScreen(),
    );
  }
}
