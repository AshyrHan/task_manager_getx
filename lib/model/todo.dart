import 'package:flutter/material.dart';

class ToDo {
  String name;
  String descrip;
  bool isDone;
  Color color;
  String category;
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
