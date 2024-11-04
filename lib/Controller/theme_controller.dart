// theme_controller.dart
import 'package:flutter/material.dart';
import 'package:apnu_umreth/Model/theme_model.dart';

class ThemeController extends ChangeNotifier {
  ThemeModel _themeModel = ThemeModel();

  ThemeData get themeData => _themeModel.themeData;

  void toggleTheme() {
    _themeModel.isDarkMode = !_themeModel.isDarkMode;
    notifyListeners();
  }
}
