import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/controllers/todo_controller.dart';
import 'package:task_manager_getx/style/appColors.dart';

// Widget catergoriesTegs() {
//   //bool isSelected = false;
//   final TodoController controller = Get.find();
//   return Container(
//     alignment: Alignment.centerLeft,
//     height: 50.0,
//     child: ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: controller.categories.length,
//       // itemCount: catList.length,
//       itemBuilder: (context, index) {
//         return Container(
//           child: Padding(
//             padding: const EdgeInsets.only(right: 8.0),
// //             ValueBuilder<bool>(
// //   initialValue: false,
// //   builder: (value, updateFn) => Switch(
// //     value: value,
// //     onChanged: updateFn, // same signature! you could use ( newValue ) => updateFn( newValue )
// //   ),
// //   // if you need to call something outside the builder method.
// //   onUpdate: (value) => print("Value updated: $value"),
// //   onDispose: () => print("Widget unmounted"),
// // ),

//             // child: ObxValue(
//             //   (data) => ChoiceChip(
//             //     label: Text(controller.categories[index].name),
//             //     selected: data.value,
//             //     onSelected: (value) {
//             //       data.value = value;
//             //     },
//             //   ),
//             //   controller.categories[index].name == 'Common'
//             //       ? true.obs
//             //       : false.obs,
//             // ),
//             // child: ObxValue(
//             //   (data) => ActionChip(
//             //       label: Text(controller.categories[index].name),
//             //       onPressed: () {
//             //         data.value = !data.value;
//             //       },
//             //       backgroundColor: data.value ? Colors.red : Colors.black12),
//             //   controller.categories[index].name == 'Common'
//             //       ? true.obs
//             //       : false.obs,
//             // ),

//             child: ObxValue(
//               (data) => ChoiceChip(
//                 label: Text(controller.categories[index].name),
//                 selected: data.value,
//                 onSelected: (value) {
//                   data.value = value;
//                 },
//               ),
//               controller.categories[index].name == 'Common'
//                   ? true.obs
//                   : false.obs,
//             ),

//             //             ValueBuilder<bool>(
// //   initialValue: false,
// //   builder: (value, updateFn) => Switch(
// //     value: value,
// //     onChanged: updateFn, // same signature! you could use ( newValue ) => updateFn( newValue )
// //   ),
// //   // if you need to call something outside the builder method.
// //   onUpdate: (value) => print("Value updated: $value"),
// //   onDispose: () => print("Widget unmounted"),
// // ),

//             // WORK with setState()
//             // child: ChoiceChip(
//             //   label: Text(controller.categories[index].name),
//             //   selected: isSelected,
//             //   onSelected: (value) => isSelected = value,
//             //   selectedColor: AppColors.taskColor,
//             // ),
//             // child: Chip(

//             //     shape: StadiumBorder(
//             //         side: BorderSide(
//             //             color: controller.categories[index].color,
//             //             //color: catList[index].color,
//             //             width: 1.5)),
//             //     label: Text(
//             //       controller.categories[index].name,
//             //       //catList[index].name,
//             //       style: TextStyle(
//             //           fontSize: 16.0, color: AppColors.primaryTextColor),
//             //     ),
//             //     backgroundColor: Colors.white),
//           ),
//         );
//       },
//     ),
//   );
// }

// class Categories {
//   String name;
//   Color color;
//   Categories({
//     this.name,
//     this.color,
//   });
// }

// List<Categories> catList = [
//   Categories(name: 'Personal', color: AppColors.taskColor),
//   Categories(name: 'Business', color: AppColors.taskColor2),
//   Categories(name: 'Family', color: AppColors.taskColor3),
//   Categories(name: 'Work', color: AppColors.taskColor),
// ];

class CategoriesChips extends StatefulWidget {
  final int mainIndex;

  const CategoriesChips({Key key, this.mainIndex}) : super(key: key);
  @override
  _CategoriesChipsState createState() =>
      _CategoriesChipsState(mainIndex: mainIndex);
}

class _CategoriesChipsState extends State<CategoriesChips> {
  final int mainIndex;
  _CategoriesChipsState({this.mainIndex});

  final TodoController controller = Get.find();

  int _defaultChoiceIndex;

  @override
  void initState() {
    _defaultChoiceIndex =
        mainIndex != null ? controller.todos[mainIndex].category : 0;
    print('mainIndex $mainIndex');
    print('_defaultChoiceIndex $_defaultChoiceIndex');
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
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                label: Text(controller.categories[index].name),
                selected: _defaultChoiceIndex == index,
                selectedColor: AppColors.accentColor,
                onSelected: (bool selected) {
                  setState(() {
                    _defaultChoiceIndex = selected ? index : 0;
                    if (mainIndex != null) {
                      var changed = controller.todos[mainIndex];
                      changed.category = index;
                      controller.todos[mainIndex] = changed;
                      controller.todos.refresh();
                    } else {
                      controller.changeCategory(index);
                    }
                    print('index: $index');
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
