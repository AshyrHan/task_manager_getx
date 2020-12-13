import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';

class ToDo {
  String name;
  String descrip;
  bool isDone;
  Color color;
  int category;
  String dateTime;

  ToDo({
    this.name,
    this.descrip,
    this.isDone,
    this.color,
    this.category,
    this.dateTime,
  });
}

class Category {
  String name;
  Color color;
  Category({
    this.name,
    this.color,
  });
}

List<Category> categoryList = [
  Category(name: 'Common', color: AppColors.accentColor),
  Category(name: 'Business', color: AppColors.taskColor),
  Category(name: 'Personal', color: AppColors.taskColor2),
  Category(name: 'Family', color: AppColors.taskColor3),
];
