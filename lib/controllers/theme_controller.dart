import 'package:amazon_locker/helpers/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

class AppThemeController extends ChangeNotifier {
  final SharedPreferencesHelper _prefs = SharedPreferencesHelper();

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryTextTheme: Typography().white,
    textTheme: Typography().white,
    appBarTheme: const AppBarTheme(
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.white,
          fixedSize: const Size(double.maxFinite, 55.0),
          textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 55.0),
          textStyle: const TextStyle(
              inherit: false, fontSize: 16.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // floatingLabelStyle: TextStyle(color: kGreenColor),
      // constraints: const BoxConstraints(minHeight: 55.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(brightness: Brightness.dark),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: TextStyle(color: Colors.white)
    ),
  );

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryTextTheme: Typography().black,
    textTheme: Typography().black,
    appBarTheme: const AppBarTheme(
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.black,
          fixedSize: const Size(double.maxFinite, 55.0),
          textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 55.0),
          textStyle: const TextStyle(
              inherit: false, fontSize: 16.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // floatingLabelStyle: TextStyle(color: kGreenColor),
      // constraints: const BoxConstraints(minHeight: 55.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(brightness: Brightness.light),
    snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white)
    ),
  );
  ThemeMode themeMode;

  AppThemeController({this.themeMode = ThemeMode.light}) {
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
