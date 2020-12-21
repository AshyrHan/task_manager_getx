import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/src/style/appColors.dart';

import '../controller.dart';

class CategoriesChips extends StatefulWidget {
  @override
  _CategoriesChipsState createState() => _CategoriesChipsState();
}

class _CategoriesChipsState extends State<CategoriesChips> {
  final TodoController controller = Get.find();

  int _defaultChoiceIndex;

  @override
  void initState() {
    _defaultChoiceIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.cat?.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                label: Text(
                  controller.cat[index].name,
                  //style: Style.h3(),
                ),
                selectedShadowColor: Colors.yellow,
                selected: _defaultChoiceIndex == index,
                selectedColor: AppColors.accentColor,
                onSelected: (bool selected) {
                  setState(() {
                    _defaultChoiceIndex = selected ? index : 0;
                    controller.setCategoryIndex = index;
                    print(controller.categoryIndex);
                  });
                },
                backgroundColor: Colors.black12,
                labelStyle: TextStyle(
                    color: (_defaultChoiceIndex == index)
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
