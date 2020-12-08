import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';

Widget menu(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Drawer(
    elevation: 5.0,
    child: SafeArea(
      child: Container(
        color: AppColors.bg,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: size.width,
            height: size.height * 0.1,
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.iconColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            width: size.width,
            height: size.height * 0.15,
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatars/avatar1.png'),
              radius: 50.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              padding: EdgeInsets.only(left: 20.0),
              width: size.width,
              height: size.height * 0.15,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olivia',
                    style: Style.h1(),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Mitchel',
                    style: Style.h1(),
                  ),
                ],
              )),
        ]),
      ),
    ),
  );
}
