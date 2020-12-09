import 'package:flutter/material.dart';

class ToDo {
  String content;
  String descrip;
  bool isDone;
  Color color;
  String category;
  DateTime dateTime;
  ToDo({
    this.content,
    this.descrip,
    this.isDone,
    this.color,
    this.category,
    this.dateTime,
  });
}
