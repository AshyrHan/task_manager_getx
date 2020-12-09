import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';
import 'package:task_manager_getx/views/widgets/calendar.dart';

class CreatTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bg,
        title: Text(
          'Create task',
          style: Style.h2(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.iconColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            taskField(context, 'Task name', 70.0),
            SizedBox(
              height: 20.0,
            ),
            taskField(context, 'Description (optional)', 120.0),
            SizedBox(
              height: 20.0,
            ),
            calendarPicker(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.accentColor,
        label: Text(
          'Create task',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  Widget taskField(BuildContext context, String hintText, double height) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 8.0),
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: Style.boxDecoration(),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Style.h3()),
        maxLines: 10,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}
