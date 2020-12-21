import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'newTask.dart';
import 'taks.dart';
import 'widget/appBar.dart';
import 'widget/categoryCard.dart';
import 'widget/drawer.dart';
import 'widget/header.dart';

class HomePage extends StatelessWidget {
  final TodoController controller = Get.put(TodoController());
  final GlobalKey _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: appBar(_key),
      drawer: menu(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'categories'.tr,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
            CategoryCard(),
            SizedBox(
              height: 20.0,
            ),
            Pages(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => Get.to(CreatTask()),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final TodoController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 800,
      child: PageView.builder(
        controller: controller.pageController.value,
        onPageChanged: (value) {
          controller.jumpToCategory(value);
        },
        scrollDirection: Axis.horizontal,
        itemCount: controller.cat?.length ?? 0,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10.0),
                    child: Text(
                      controller.cat[index].name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
              Tasks(
                pageIndex: index,
              ),
            ],
          );
        },
      ),
    );
  }
}
