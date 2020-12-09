import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';

AppBar appBar(GlobalKey<ScaffoldState> key) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.bg,
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
        padding: const EdgeInsets.only(right: 18.0),
        child: InkWell(
          child: Icon(
            Icons.search,
            color: AppColors.iconColor,
            size: 26.0,
          ),
          onTap: () {},
        ),
      ),
    ],
  );
}
