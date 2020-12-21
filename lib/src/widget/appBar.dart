import 'package:flutter/material.dart';
import 'package:task_manager_getx/src/style/appColors.dart';

AppBar appBar(GlobalKey<ScaffoldState> key) {
  // final TodoController controller = Get.find();
  return AppBar(
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: InkWell(
        child: Icon(
          Icons.menu,
          color: AppColors.iconColor,
        ),
        onTap: () {
          key.currentState.openDrawer();
        },
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 13.0),
        child: IconButton(
          tooltip: 'still not working',
          icon: Icon(
            Icons.search,
            color: AppColors.iconColor,
            size: 26.0,
          ),
          onPressed: () {},
        ),
      ),
    ],
  );
}
