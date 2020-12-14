import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/controllers/todo_controller.dart';
import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';

class CategoryCard extends StatelessWidget {
  final TodoController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(
      () => Container(
        margin: EdgeInsets.only(left: 15.0),
        height: size.height * 0.18,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final int complate = controller.taskProgress(index).first;
            final int all = controller.taskProgress(index).last;
            final progress = complate / all;
            return Container(
              margin: EdgeInsets.only(right: 10.0),
              width: size.width * 0.5,
              child: Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //${complate.toString()}/${all.toString()}
                      Text(
                        '${controller.taskDone}/${controller.taskCommon} old ${complate.toString()}/${all.toString()}',
                        style: Style.h4(),
                      ),
                      Text(
                        controller.categories[index].name,
                        style: Style.h2(),
                      ),
                      LinearProgressIndicator(
                        value: (progress.isNaN) ? 0.0 : progress,
                        backgroundColor: Colors.black12,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            controller.categories[index].color),
                      ),
                      IconButton(
                          icon: Icon(Icons.gesture),
                          onPressed: () => print(progress.isNaN))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardClass {
  String cardName;
  int complateTasts;
  int initTasks;
  Color color;
  CardClass({this.cardName, this.complateTasts, this.initTasks, this.color});
}

List<CardClass> cardList = [
  CardClass(
      cardName: 'Business',
      complateTasts: 14,
      initTasks: 27,
      color: AppColors.taskColor),
  CardClass(
      cardName: 'Pesonal',
      complateTasts: 10,
      initTasks: 14,
      color: AppColors.taskColor2),
  CardClass(
      cardName: 'Family',
      complateTasts: 4,
      initTasks: 19,
      color: AppColors.taskColor3),
];
