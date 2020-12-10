import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/controllers/todo_controller.dart';
import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';
import 'package:task_manager_getx/views/widgets/calendar.dart';
import 'package:task_manager_getx/views/widgets/categories.dart';

// ignore: must_be_immutable
class CreatTask extends StatelessWidget {
  final int index;

  CreatTask({this.index});

  final TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController taskNameController = TextEditingController(
        text: index != null ? controller.todos[index].name : null);
    TextEditingController taskDescripController = TextEditingController(
        text: index != null ? controller.todos[index].descrip : null);
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
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  taskField(context, 'Task name', 70.0, taskNameController),
                  SizedBox(
                    height: 20.0,
                  ),
                  taskField(context, 'Description (optional)', 220.0,
                      taskDescripController),
                  SizedBox(
                    height: 20.0,
                  ),
                  additinalPicker(context, index),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CATEGORIES',
                      style: Style.h3(),
                    ),
                    catergoriesTegs(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (this.index == null) {
            controller.addTask(
              taskNameController?.text,
              taskDescripController.text,
            );
          } else {
            controller.editTask(
                taskNameController.text, taskDescripController?.text, index);
            // controller.todos[index].name = taskNameController.text;
            // controller.todos[index].descrip = taskDescripController?.text;
            // controller.todos[index].color = controller.color.value;
            // controller.todos[index].dateTime = controller.time?.value;
          }

          Get.back();
        },
        backgroundColor: AppColors.accentColor,
        label: Text(
          (this.index != null) ? 'Edit task' : 'Create task',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  Widget taskField(
      BuildContext context, String hintText, double height, textController) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 8.0),
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: Style.boxDecoration(),
      child: TextFormField(
        autofocus: false,
        controller: textController,
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
