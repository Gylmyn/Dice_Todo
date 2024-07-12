import 'package:dice_todo/app/components/text_field.dart';
import 'package:dice_todo/app/modules/home/controllers/home_controller.dart';
import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'button.dart';

class DialogBox extends GetView<ThemeController> {
  final TextEditingController taskcontroller;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;

  const DialogBox({
    super.key,
    required this.taskcontroller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final homeC = Get.find<HomeController>();
    return Obx(() => Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                decoration: BoxDecoration(
                  color: controller.isDarkMode.value
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Add Task',
                              style: TextStyle(
                                fontSize: 20,
                                color: controller.isDarkMode.value
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade900,
                              )),
                          IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: onCancel,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Obx(() => ListView.builder(
                            itemCount: homeC.toDoSugesstion.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(() => ListTile(
                                  title: Text(homeC.toDoSugesstion[index]),
                                  onTap: () => homeC.accSugesstion(index)));
                            })))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                      child: MyTextField(
                          hintText: 'Enter Task',
                          fieldController: taskcontroller)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: MyButton(
                      useIcon: true,
                      icon: const Icon(Icons.send_rounded),
                      onPressed: onSave,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
