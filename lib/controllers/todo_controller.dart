import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:task_manager_getx/model/todo.dart';
import 'package:task_manager_getx/style/appColors.dart';

class TodoController extends GetxController {
  var todos = List<ToDo>().obs;

  void addTask(String text, String descrip) {
    todos.add(ToDo(
        name: text,
        descrip: descrip,
        isDone: false,
        color: color.value,
        category: _category.value,
        dateTime: time.value));
    print('task added');
    print(todos.last.descrip);
    color.value = AppColors.taskColor;
    _category.value = 'Personal';
    time.value = 'Set data';
  }

  void editTask(String text, String descrip, int index) {
    todos[index].name = text;
    todos[index].descrip = descrip;

    print('task edited');
    //color.value = AppColors.taskColor;
  }

  //utils
  var color = AppColors.taskColor.obs;

  void changeColor(Color newColor) => color.value = newColor;

  var _category = 'Personal'.obs;

  void changeCategory(String category) => _category.value = category;

  var time = 'Set data'.obs;

  void changeDateTime(String newTime) => time.value = newTime;
}
