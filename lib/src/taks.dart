import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';

import 'controller.dart';
import 'editTask.dart';
import 'style/appColors.dart';
import 'style/style.dart';

class Tasks extends StatelessWidget {
  final int pageIndex;
  Tasks({@required this.pageIndex});

  final TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.cat[pageIndex].todo.length == 0) {
        return emptyTask();
      } else {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.cat[pageIndex].todo?.length ?? 0,
              itemBuilder: (context, index) {
                var item = controller.cat[pageIndex].todo;
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          offset: Offset(0, 0),
                          blurRadius: 8,
                        ),
                      ]),
                  child: ListTile(
                    onTap: () => Get.to(EditTask(
                        cIndex: pageIndex, tIndex: index, todo: item[index])),
                    leading: GestureDetector(
                      onTap: () {
                        controller.changeStatus(pageIndex, index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: (item[index].isDone)
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.grey[400],
                                    size: 30,
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: HexColor(
                                              controller.cat[pageIndex].color),
                                          width: 2.0),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      item[index].name,
                      //    style: Theme.of(context).textTheme.headline6,
                      style: (!item[index].isDone)
                          ? Theme.of(context).textTheme.headline6
                          : Theme.of(context).textTheme.headline6.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: (item[index].descrip != '')
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 5.0),
                            child: Text(
                              item[index].descrip,
                              style: Style.h4(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : null,
                    trailing: Container(
                      width: 55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              (item[index].dateTime != null)
                                  ? Icon(
                                      Icons.notifications_active,
                                      color: AppColors.iconColor,
                                      size: 20,
                                    )
                                  : SizedBox(),
                              SizedBox(
                                width: 5.0,
                              ),
                              showContextMenuButton(context, index, item),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      }
    });
  }

  showContextMenuButton(BuildContext context, int index, item) {
    return PopupMenuButton(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Theme.of(context).dialogBackgroundColor,
      onSelected: (value) {
        controller.removeTODO(pageIndex, index, value, item);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('edit'.tr),
              Icon(
                Icons.edit,
                color: AppColors.iconColor,
              )
            ],
          ),
          value: 'edit',
        ),
        PopupMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('delete'.tr),
              Icon(
                Icons.delete_outline,
                color: AppColors.iconColor,
              )
            ],
          ),
          value: 'delete',
        ),
      ],
      child: Icon(Icons.more_vert),
    );
  }

  Widget emptyTask() {
    return Text(
      'noTasks'.tr,
      style: Theme.of(Get.context).textTheme.subtitle1,
    );
  }
}
