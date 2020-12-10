import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';

Widget catergoriesTegs() {
  return Container(
    alignment: Alignment.centerLeft,
    height: 50.0,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: catList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
                shape: StadiumBorder(
                    side: BorderSide(color: catList[index].color, width: 1.5)),
                label: Text(
                  catList[index].name,
                  style: TextStyle(
                      fontSize: 16.0, color: AppColors.primaryTextColor),
                ),
                backgroundColor: Colors.white),
          ),
        );
      },
    ),
  );
}

class Categories {
  String name;
  Color color;
  Categories({
    this.name,
    this.color,
  });
}

List<Categories> catList = [
  Categories(name: 'Personal', color: AppColors.taskColor),
  Categories(name: 'Business', color: AppColors.taskColor2),
  Categories(name: 'Family', color: AppColors.taskColor3),
  Categories(name: 'Work', color: AppColors.taskColor),
];
