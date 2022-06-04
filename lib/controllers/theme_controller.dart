import 'package:amazon_locker/helpers/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  final SharedPreferencesHelper _prefs = SharedPreferencesHelper();

  final ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
  final ThemeData lightTheme = ThemeData(brightness: Brightness.light);
  ThemeMode themeMode;

  ThemeController({this.themeMode = ThemeMode.light}) {
    _initTheme();
  }

  void _initTheme() async {
    String? theme = await _prefs.get(tag: 'theme_mode');

    if (theme == null) {
      _prefs.store(tag: 'theme_mode', data: themeMode.toString());
    } else {
      switch (theme) {
        case 'ThemeMode.light':
          themeMode = ThemeMode.light;
          break;
        case 'ThemeMode.dark':
          themeMode = ThemeMode.dark;
          break;
      }
    }

    notifyListeners();
  }

  void changeAppTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    _prefs.store(tag: 'theme_mode', data: themeMode.toString());
    notifyListeners();
  }
}
