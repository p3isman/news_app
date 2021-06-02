import 'package:flutter/material.dart';
import 'package:get/get.dart';

var theme = 'light'.obs;

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.pink,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  toggleableActiveColor: Colors.pink,
  accentColor: Colors.pink,
);

void changeTheme() {
  if (theme.value == 'light') {
    Get.changeThemeMode(ThemeMode.dark);
    theme.value = 'dark';
  } else {
    Get.changeThemeMode(ThemeMode.light);
    theme.value = 'light';
  }
}
