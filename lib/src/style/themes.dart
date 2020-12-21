import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'appColors.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    buttonColor: AppColors.accentColor,
    appBarTheme: AppBarTheme(
      color: AppColors.bg,
    ),
    dialogBackgroundColor: AppColors.bg,
    iconTheme: IconThemeData().copyWith(
      color: AppColors.iconColor,
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColors.accentColor),
    textTheme: TextTheme().copyWith(
      headline3: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryTextColor,
      ),
      headline4: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
      ),
      headline5: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryTextColor,
      ),
      headline6: TextStyle(
        fontSize: 19.0,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryTextColor,
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: AppColors.h3Color,
      ),
      subtitle2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.h3Color,
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.bgDark,
    buttonColor: AppColors.accentColor,
    appBarTheme: AppBarTheme(
      color: AppColors.bgDark,
    ),
    toggleableActiveColor: AppColors.accentColor,
    iconTheme: IconThemeData(color: AppColors.iconColor),
    //cardColor: AppColors.aleriColor,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColors.accentColor),
    dialogBackgroundColor: AppColors.bgDark,
    textTheme: TextTheme().copyWith(
      headline3: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: AppColors.alerColor,
      ),
      headline4: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: AppColors.alerColor,
      ),
      headline5: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColors.alerColor,
      ),
      headline6: TextStyle(
        fontSize: 19.0,
        fontWeight: FontWeight.w400,
        color: AppColors.alerColor,
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: AppColors.h3Color,
      ),
      subtitle2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.h3Color,
      ),
    ),
  );
}

class ThemeService {
  final _themeBox = GetStorage();
  final _key = 'isDarkTheme';

  ThemeMode get theme =>
      _loadThemeFromStorage() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromStorage() => _themeBox.read(_key) ?? false;

  _saveThemeToBox(bool isDarkMode) => _themeBox.write(_key, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(
        _loadThemeFromStorage() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromStorage());
  }
}
