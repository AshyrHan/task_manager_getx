import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appColors.dart';

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

  static h3plus() {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
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

  static boxDecoration(context) {
    return BoxDecoration(
      color: Get.isDarkMode ? Theme.of(context).cardColor : Colors.white,
      borderRadius: BorderRadius.circular(14.0),
      boxShadow: [
        BoxShadow(
          blurRadius: 10.0,
          color: Colors.grey.withOpacity(0.08),
          offset: Offset(0, 1),
          spreadRadius: 1,
        )
      ],
    );
  }
}
