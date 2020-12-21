import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_getx/src/style/appColors.dart';
import 'package:task_manager_getx/src/style/style.dart';

import '../controller.dart';

class SetNotify extends StatefulWidget {
  final String date;
  SetNotify({this.date});

  @override
  _SetNotifyState createState() => _SetNotifyState(date: date);
}

class _SetNotifyState extends State<SetNotify> {
  final String date;
  _SetNotifyState({this.date});

  final TodoController controller = Get.find();

  String _tempDate;

  @override
  Widget build(BuildContext context) {
    final lang = GetStorage().read('lang');
    return Container(
      width: Get.width,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              DatePicker.showDateTimePicker(context,
                  currentTime: DateTime.now(),
                  locale: lang == 'ru_RU' ? LocaleType.ru : LocaleType.en,
                  onCancel: () => Navigator.of(context).pop(),
                  onConfirm: (time) {
                    setState(() {
                      _tempDate = time.toString();
                      controller.setNotifyDate = time.toString();
                    });
                  },
                  theme: DatePickerTheme(
                    backgroundColor: Colors.white,
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: Style.boxDecoration(context),
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
                    (widget.date == null)
                        ? _tempDate != null
                            ? DateFormat('d MMM y')
                                .format(DateTime.parse(_tempDate))
                            : 'setDate'.tr
                        : DateFormat('d MMM y')
                            .format(DateTime.parse(widget.date)),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
