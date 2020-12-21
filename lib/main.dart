import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/src/lang/translations.dart';
import 'package:task_manager_getx/src/style/themes.dart';
import 'src/home.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  final lang = GetStorage().read('lang');
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: lang != null ? Locale(lang) : Locale('ru_RU'),
      translations: MyTranslations(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: HomePage(),
    );
  }
}
