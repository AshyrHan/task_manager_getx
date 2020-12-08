import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';

class Style {
  static h1() {
    return TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryTextColor,
    );
  }

  static h2() {
    return TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryTextColor,
    );
  }

  static h3() {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.h3Color,
    );
  }

  static h4() {
    return TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.h3Color,
    );
  }

  static tastTextStyle() {
    return TextStyle(
      fontSize: 19.0,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor,
    );
  }
}
