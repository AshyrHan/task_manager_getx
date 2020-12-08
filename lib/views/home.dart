import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';
import 'package:task_manager_getx/views/widgets/appBar.dart';
import 'package:task_manager_getx/views/widgets/categoryCard.dart';
import 'package:task_manager_getx/views/widgets/header.dart';
import 'package:task_manager_getx/views/widgets/taks.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Header(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text('CATEGORIES', style: Style.h3()),
                ),
              ],
            ),
            CategoryCard(),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text('TASKS', style: Style.h3()),
                ),
              ],
            ),
            Tasks(),
          ],
        ),
      ),
    );
  }
}
