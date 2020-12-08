import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';
import 'package:task_manager_getx/views/drawer.dart';
import 'package:task_manager_getx/views/widgets/appBar.dart';
import 'package:task_manager_getx/views/widgets/categoryCard.dart';
import 'package:task_manager_getx/views/widgets/header.dart';
import 'package:task_manager_getx/views/widgets/taks.dart';

class Home extends StatelessWidget {
  final GlobalKey _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.bg,
      appBar: appBar(_key),
      drawer: menu(context),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accentColor,
        elevation: 5.0,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
