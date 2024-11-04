// theme_model.dart
import 'package:flutter/material.dart';

class ThemeModel {
  bool isDarkMode;

  ThemeModel({this.isDarkMode = false});

  ThemeData get themeData => isDarkMode ? ThemeData.dark() : ThemeData.light();
}
