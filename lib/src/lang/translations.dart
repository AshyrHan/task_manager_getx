import 'package:get/get.dart';
import 'package:task_manager_getx/src/lang/en_us.dart';
import 'package:task_manager_getx/src/lang/ru_ru.dart';
import 'package:task_manager_getx/src/lang/tm_tm.dart';

import 'en_us.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ru_RU': ruRU,
        'tm_TM': tmTM,
      };

  static final List<LanguagesClass> langs = [
    LanguagesClass(lang: 'English', path: ''),
    LanguagesClass(lang: 'Русский', path: ''),
    LanguagesClass(lang: 'Türkmen', path: ''),
  ];
}

class LanguagesClass {
  final String lang;
  final String path;

  LanguagesClass({this.lang, this.path});
}
