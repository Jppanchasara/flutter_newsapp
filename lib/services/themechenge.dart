import 'package:flutter/material.dart';

class MyThemes {
  static final darklight =
      ThemeData(
        colorScheme: ColorScheme.light(),
        scaffoldBackgroundColor: Colors.grey.shade900);
  static final lightTheme =
      ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.dark());
}