import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/src/lang/translations.dart';
import 'package:task_manager_getx/src/style/appColors.dart';
import 'package:task_manager_getx/src/style/themes.dart';

import '../controller.dart';

Widget menu(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Drawer(
    elevation: 5.0,
    child: SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: size.width,
            height: size.height * 0.1,
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.iconColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            width: size.width,
            height: size.height * 0.15,
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                GetStorage().hasData('avatar')
                    ? GetStorage().read('avatar')
                    : 'assets/avatars/avatar1.png',
              ),
              radius: 50.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              padding: EdgeInsets.only(left: 20.0),
              width: size.width,
              height: size.height * 0.15,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    GetStorage().hasData('userName')
                        ? GetStorage().read('userName')
                        : '',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  // Text('Mitchel', style: Theme.of(context).textTheme.headline3),
                ],
              )),
          Container(
            padding: EdgeInsets.only(left: 5.0),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.folder_open,
                  ),
                  title: Text(
                    'categories'.tr,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.data_usage,
                  ),
                  title: Text(
                    'analitics'.tr,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.brightness_6,
                  ),
                  title: Text(
                    'nightMode'.tr,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: Switch(
                      value: Get.isDarkMode,
                      onChanged: (value) => ThemeService().switchTheme()),
                ),
                ListTile(
                  leading: Icon(Icons.translate),
                  title: Text(
                    'changeLang'.tr,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: GestureDetector(
                    onTap: () => showLanguages(context),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    ),
  );
}

void showLanguages(context) {
  final TodoController controller = Get.find();
  showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            content: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                width: 300,
                height: 200,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: MyTranslations.langs.length,
                    itemBuilder: (context, index) {
                      var item = MyTranslations.langs[index];
                      return ListTile(
                        onTap: () {
                          controller.changeLang(index);
                          Get.back();
                        },
                        leading: Icon(Icons.flag),
                        title: Text(item.lang),
                      );
                    }),
              ),
            ),
            title: Text('chooseLang'.tr),
            actions: [
              CupertinoDialogAction(
                  child: Text('close'.tr),
                  onPressed: () => Navigator.pop(context)),
            ],
          ));
}
