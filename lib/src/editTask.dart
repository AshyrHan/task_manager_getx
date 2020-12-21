import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'model/model.dart';
import 'style/appColors.dart';
import 'style/style.dart';
import 'widget/calendar.dart';

class EditTask extends StatelessWidget {
  final int cIndex;
  final int tIndex;
  final Todo todo;
  EditTask({
    @required this.cIndex,
    @required this.tIndex,
    @required this.todo,
  });

  final TodoController controller = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    final TextEditingController taskNameController =
        TextEditingController(text: todo.name);
    final TextEditingController descripNameController =
        TextEditingController(text: todo.descrip);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //  backgroundColor: AppColors.bg,
        title: Text(
          'editTask'.tr,
          style: Theme.of(context).textTheme.headline4,
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
        actions: [
          IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
              onPressed: () {
                controller.cat[cIndex].todo.removeAt(tIndex);
                controller.cat.refresh();
                Get.back();
              })
        ],
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
                  taskField(
                    context,
                    'taskName'.tr,
                    70.0,
                    taskNameController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  taskField(
                    context,
                    'description'.trArgs(['optional'.tr]),
                    220.0,
                    descripNameController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SetNotify(
                    date: todo.dateTime,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.editTODO(taskNameController.text,
              descripNameController.text, cIndex, tIndex);
        },
        backgroundColor: AppColors.accentColor,
        label: Row(
          children: [
            Text(
              'save'.tr,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            SizedBox(
              width: 5.0,
            ),
            Icon(Icons.save),
          ],
        ),
      ),
    );
  }

  Widget taskField(
    BuildContext context,
    String hintText,
    double height,
    formController,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 8.0),
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: Style.boxDecoration(context),
      child: TextFormField(
        style: Theme.of(context).textTheme.headline5,
        autofocus: false,
        controller: formController,
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
