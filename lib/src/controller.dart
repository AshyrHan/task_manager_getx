import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/src/model/model.dart';

import 'editTask.dart';
import 'style/appColors.dart';

class TodoController extends GetxController {
  var cat = List<Category>().obs;

  // main functions

  //add todo
  void addTODO(String tName, String dName) {
    if (tName.length != 0) {
      cat[_category].todo.add(Todo(
          name: tName, descrip: dName ?? null, dateTime: _notifyDate ?? null));
      print('todo added');
      cat.refresh();
      Get.back();
    } else {
      Get.snackbar('error'.tr, 'notEmpty'.tr);
    }
    setCategoryIndex = 0;
    setNotifyDate = null;
  }

  //edit todo
  void editTODO(String tName, String dName, int cIndex, int tIndex) {
    if (tName.length != 0) {
      cat[cIndex].todo[tIndex].name = tName;
      cat[cIndex].todo[tIndex].descrip = dName;
      cat[cIndex].todo[tIndex].dateTime =
          notifyDate != null ? notifyDate : cat[cIndex].todo[tIndex].dateTime;
      print('task edited');
      cat.refresh();
      Get.back();
    } else {
      Get.snackbar('error'.tr, 'notEmpty'.tr);
    }
    setCategoryIndex = 0;
    setNotifyDate = null;
  }

  void removeTODO(int cIndex, int tIndex, String value, item) {
    if (value == 'edit') {
      Get.to(EditTask(cIndex: cIndex, tIndex: tIndex, todo: item[tIndex]));
    } else {
      var removedObject = item[tIndex];
      cat[cIndex].todo.removeAt(tIndex);
      Get.snackbar('return'.tr, '',
          colorText: Colors.white,
          backgroundColor: AppColors.accentColor,
          duration: Duration(seconds: 5),
          //icon: Icon(Icons.undo_sharp),
          mainButton: FlatButton(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Text(
              'undo'.tr,
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              print('returned');
              cat[cIndex].todo.insert(tIndex, removedObject);
              cat.refresh();
            },
          ));
    }
    cat.refresh();
  }

  // change status true/false
  void changeStatus(cIndex, tIndex) {
    cat[cIndex].todo[tIndex].isDone = !cat[cIndex].todo[tIndex].isDone;
    cat.refresh();
    print('todo changed');
  }

  // category index
  int _category = 0;
  set setCategoryIndex(int index) => _category = index;
  String _notifyDate;
  set setNotifyDate(String date) => _notifyDate = date;

  //Getters
  String get notifyDate => _notifyDate;
  int get categoryIndex => _category;
  int todoCount1(cIndex) => cat[cIndex].todo.length;
  int doneTodo1(cIndex) =>
      cat[cIndex].todo.where((todo) => todo.isDone == true).length;
  double progress(cIndex) {
    double result = (doneTodo1(cIndex) / todoCount1(cIndex));
    return result.isNaN ? 0.0 : result;
  }

  ///
  ///
  //pageview controller
  var pageController = PageController().obs;
  var categoryController = ScrollController().obs;
  //var currentPosition = 0.obs;

  // void set setPosition(index) {

  // }
  void jumpToCategory(int index) {
    var jump = index.toDouble() * 200;
    categoryController.value.jumpTo(jump);
  }

  void jumpToPage(int cIndex) {
    // print(currentPosition);
    pageController.value.animateToPage(cIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }
  //Localization

  changeLang(index) {
    var locale = Locale('en_US');
    var locale1 = Locale('ru_RU');
    var locale2 = Locale('tm_TM');
    switch (index) {
      case 0:
        Get.updateLocale(locale);
        GetStorage().write('lang', 'en_US');
        changeCatName();
        break;
      case 1:
        Get.updateLocale(locale1);
        GetStorage().write('lang', 'ru_RU');
        changeCatName();
        break;
      case 2:
        Get.updateLocale(locale2);
        GetStorage().write('lang', 'tm_TM');
        changeCatName();
        break;
      default:
        Get.updateLocale(locale);
    }
  }

  void changeCatName() {
    cat[0].name = 'common'.tr;
    cat[1].name = 'work'.tr;
    cat[2].name = 'personal'.tr;
  }

  @override
  void onInit() {
    cat.add(Category(
        name: 'Общий', color: AppColors.taskColor, todo: List<Todo>()));
    cat.add(Category(
        name: 'Работа'.tr, color: AppColors.taskColor2, todo: List<Todo>()));
    cat.add(Category(
        name: 'Личный', color: AppColors.taskColor3, todo: List<Todo>()));

    List storedTodos = GetStorage().read<List>('todos');

    if (!storedTodos.isNull) {
      cat = storedTodos.map((e) => Category.fromJson(e)).toList().obs;
    }
    ever(cat, (_) {
      GetStorage().write('todos', cat.toJson());
    });
    super.onInit();
  }

  void deleteAll() {
    GetStorage().remove('todos');
  }
}
