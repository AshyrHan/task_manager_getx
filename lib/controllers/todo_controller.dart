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
    print(todos.last.dateTime);
    color.value = AppColors.taskColor;
    _category.value = 0;
    time.value = 'Set data';
    todos.refresh();
  }

  void editTask(String text, String descrip, int index) {
    todos[index].name = text;
    todos[index].descrip = descrip;
    // todos[index].category = _category.value;
    print('task edited');
    todos.refresh();
    //color.value = AppColors.taskColor;
  }

  //utils
  var color = AppColors.taskColor.obs;

  void changeColor(Color newColor) => color.value = newColor;

  var _category = 0.obs;

  void changeCategory(int index) => _category.value = index;

  var time = 'Set data'.obs;

  void changeDateTime(String newTime) => time.value = newTime;

  var categories = categoryList.obs;

  var taskCommon = 0.obs;
  var taskDone = 0.obs;

  List taskProgress(index) {
    List<int> results = [];
    var complatedTasks = 0;
    var allTask = 0;
    for (var i in todos) {
      if (i.category == index) {
        allTask++;
        if (i.isDone) {
          complatedTasks++;
        }
      }
    }
    taskDone(complatedTasks);
    taskCommon(allTask);
    results.add(complatedTasks);
    results.add(allTask);
    return results;
  }
}
