import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:task_manager_getx/controllers/todo_controller.dart';

import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';

Widget additinalPicker(context, int index) {
  final TodoController controller = Get.find();
  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('d MMM y').format(now);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () => showColors(context, index),
        child: Container(
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
              Obx(() => Icon(
                    Icons.lens,
                    color: index == null
                        ? controller.color.value
                        : controller.todos[index].color,
                  )),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          DatePicker.showDateTimePicker(context,
              currentTime: DateTime.now(),
              locale: LocaleType.ru,
              onCancel: () => Navigator.of(context).pop(),
              onConfirm: (time) {
                if (index != null) {
                  var _editing = controller.todos[index];
                  _editing.dateTime = time.toString();
                  controller.todos[index] = _editing;
                } else {
                  controller.changeDateTime(time.toString());
                }

                // controller.changeDateTime(time.toString());
                print(time);
              },
              theme: DatePickerTheme(
                backgroundColor: Colors.white,
              ));
        },
        child: Container(
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
              Obx(() => Text(
                    (index == null)
                        ? (controller.time.value == 'Set data')
                            ? 'Set data'
                            : DateFormat('d MMM y')
                                .format(DateTime.parse(controller.time.value))
                        : (controller.todos[index].dateTime == 'Set data')
                            ? 'Set data'
                            : DateFormat('d MMM y').format(DateTime.parse(
                                controller.todos[index].dateTime)),
                    style: Style.h3plus(),
                  ))
            ],
          ),
        ),
      ),
    ],
  );
}

void showColors(context, int mainIndex) {
  final TodoController controller = Get.find();
  showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            content: Container(
              width: 300,
              height: 150,
              child: GridView.builder(
                  itemCount: AppColors().appColorsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    Color color = AppColors().appColorsList[index];
                    return GestureDetector(
                      onTap: () {
                        print(color.value);

                        if (mainIndex == null) {
                          controller.changeColor(color);
                        } else {
                          var editing = controller.todos[mainIndex];
                          editing.color = color;
                          controller.todos[mainIndex] = editing;
                        }
                        Get.back();
                      },
                      child: Icon(
                        Icons.lens,
                        color: AppColors().appColorsList[index],
                        size: 40,
                      ),
                    );
                  }),
            ),
            title: Text('Choose color'),
            actions: [
              CupertinoDialogAction(
                  child: Text('Close'),
                  onPressed: () => Navigator.pop(context)),
            ],
          ));
}
