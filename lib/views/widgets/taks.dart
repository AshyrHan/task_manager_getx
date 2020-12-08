import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';

import 'package:task_manager_getx/style/style.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 7.0),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Colors.grey.withOpacity(0.08),
                  offset: Offset(0, 1),
                  spreadRadius: 1,
                )
              ],
            ),
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: tasks[index].isDone
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.grey[400],
                            size: 30,
                          )
                        : Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2.0),
                              shape: BoxShape.circle,
                            ),
                          ),
                  ),
                ],
              ),
              title: Text(
                tasks[index].text,
                style: Style.tastTextStyle(),
              ),
              subtitle: (tasks[index].descrip != null)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 5.0),
                      child: Text(
                        tasks[index].descrip,
                        style: Style.h4(),
                      ),
                    )
                  : null,
              trailing: (tasks[index].date != null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_active,
                          color: AppColors.iconColor,
                        )
                      ],
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class TaskClass {
  bool isDone;
  String text;
  String descrip;
  Color color;
  DateTime date;
  String category;

  TaskClass(
      {@required this.isDone,
      @required this.text,
      this.descrip,
      this.color,
      this.date,
      this.category});
}

List<TaskClass> tasks = [
  TaskClass(
      text: 'Bazara gitmeli',
      descrip: 'balyk almaly',
      isDone: false,
      color: AppColors.taskColor),
  TaskClass(
      text: 'Servery tolemeli',
      descrip: 'yyldyrym.com',
      isDone: false,
      color: AppColors.taskColor2,
      date: DateTime.now()),
  TaskClass(
    text: 'SSD onarmaly',
    isDone: true,
    color: AppColors.taskColor2,
  ),
  TaskClass(
    text: 'Kopmyutery arassalamaly',
    isDone: false,
    color: AppColors.taskColor2,
  ),
  TaskClass(
    text: 'Mayan yupini almaly',
    descrip: 'ak',
    isDone: true,
    color: AppColors.taskColor3,
  ),
  TaskClass(
    text: 'Mashynyn pechini gorkezmeli',
    isDone: false,
    color: AppColors.taskColor,
  ),
];
