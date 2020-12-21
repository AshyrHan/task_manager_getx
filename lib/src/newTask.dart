import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'style/style.dart';
import 'widget/calendar.dart';
import 'widget/categories.dart';

class CreatTask extends StatelessWidget {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController descripNameController = TextEditingController();
  final TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'creatTask'.tr,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
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
                  taskField(context, 'taskName'.tr, 70.0, taskNameController),
                  SizedBox(
                    height: 20.0,
                  ),
                  taskField(context, 'description'.trArgs(['optional'.tr]),
                      220.0, descripNameController),
                  SizedBox(
                    height: 20.0,
                  ),
                  SetNotify(),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'categories'.tr,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    CategoriesChips(),
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
          controller.addTODO(
            taskNameController.text,
            descripNameController.text,
          );
        },
        label: Text(
          'creatTask'.tr,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  Widget taskField(
      BuildContext context, String hintText, double height, controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 8.0),
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: Style.boxDecoration(context),
      child: TextFormField(
        autofocus: false,
        controller: controller,
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
