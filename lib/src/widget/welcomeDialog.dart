import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager_getx/src/controller.dart';

showWelcomeDialog(bool boo) {
  GetStorage().write('isLogged', true);
  print(GetStorage().read('isLogged'));
  if (!boo) {
    final TodoController controller = Get.put(TodoController());
    final TextEditingController nameController = TextEditingController();
    final String avatar1 = 'assets/avatars/avatar1.png';
    final String avatar2 = 'assets/avatars/avatar2.png';
    return Get.defaultDialog(
        title: 'welcome'.tr,
        backgroundColor: Colors.white,
        barrierDismissible: false,
        confirm: FlatButton(
            onPressed: () {
              controller.saveProfilData(nameController.text);
            },
            child: Text('confirm'.tr)),
        content: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Obx(() {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: GestureDetector(
                          onTap: () {
                            controller.avatar.value = avatar1;
                          },
                          child: ClipOval(
                            child: Container(
                              width: 84,
                              height: 84,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: controller.avatar.value == avatar1
                                        ? Colors.red
                                        : Colors.white,
                                    width: 2.0),
                              ),
                              child: Image.asset(
                                avatar1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.compare_arrows),
                      Container(
                        width: 80,
                        height: 80,
                        child: GestureDetector(
                          onTap: () {
                            controller.avatar.value = avatar2;
                          },
                          child: ClipOval(
                            child: Container(
                              width: 84,
                              height: 84,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: controller.avatar.value == avatar2
                                        ? Colors.red
                                        : Colors.white,
                                    width: 2.0),
                              ),
                              child: Image.asset(
                                avatar2,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]);
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'yName'.tr,
                  style: Theme.of(Get.context).textTheme.headline5,
                ),
              ),
              Container(
                height: 45,
                child: TextField(
                  controller: nameController,
                  maxLines: 1,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  style: Theme.of(Get.context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.black87),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    fillColor: Colors.white70,
                    filled: true,
                    hintText: 'exName'.tr,
                    hintStyle:
                        TextStyle(height: 1, fontStyle: FontStyle.italic),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
