import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controller.dart';

class CategoryCard extends StatelessWidget {
  final TodoController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() => Container(
          margin: EdgeInsets.only(left: 15.0),
          height: size.height * 0.18,
          child: ListView.builder(
            controller: controller.categoryController.value,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.cat?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => controller.jumpToPage(index),
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  width: size.width * 0.5,
                  child: Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${controller.doneTodo1(index)} / ${controller.todoCount1(index)}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                controller.progress(index) == 0.0
                                    ? ''
                                    : '${(controller.progress(index) * 100).floor()}%',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                          Text(
                            controller.cat[index].name,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          LinearProgressIndicator(
                            semanticsLabel: '${controller.progress(index)}%',
                            value: controller.progress(index),
                            backgroundColor: Colors.black12,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                HexColor(controller.cat[index].color)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
