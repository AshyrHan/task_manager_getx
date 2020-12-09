import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';

Widget calendarPicker(context) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('d MMM y').format(now);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 45.0,
        padding: EdgeInsets.all(10.0),
        decoration: Style.boxDecoration(),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Color',
              style: Style.h3plus(),
            ),
            Icon(
              Icons.panorama_fish_eye,
              color: AppColors.taskColor2,
            )
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 45.0,
        padding: EdgeInsets.all(10.0),
        decoration: Style.boxDecoration(),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.calendar,
              color: AppColors.accentColor,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              formattedDate,
              style: Style.h3plus(),
            )
          ],
        ),
      ),
    ],
  );
}
