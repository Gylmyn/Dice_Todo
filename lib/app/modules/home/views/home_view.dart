import 'package:dice_todo/app/components/dialog.dart';
import 'package:dice_todo/app/components/todo_tile.dart';
import 'package:dice_todo/app/routes/app_pages.dart';
import 'package:dice_todo/app/utils/datetime/date_time.dart';
import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    void createNewTask() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller.taskController,
            onSave: controller.saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
    }

    return Scaffold(
        drawer: Drawer(
          width: 320,
          shape: const BeveledRectangleBorder(),
          child: Obx(() => ListView(
                children: [
                  const Gap(12),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: themeC.isDarkMode.value
                          ? Colors.grey.shade900
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Image.asset('assets/logo-img.png'),
                    ),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: themeC.isDarkMode.value
                              ? Colors.grey.shade900
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.calendar_month_sharp,
                              size: 64,
                            ),
                            Text(DateTimeUtils.getCurrentDay(),
                                style: TextStyle(
                                    color: themeC.isDarkMode.value
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade900,
                                    fontWeight: FontWeight.bold)),
                            Text(DateTimeUtils.getCurrentDate(),
                                style: TextStyle(
                                    color: themeC.isDarkMode.value
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade900,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      // const Spacer(),
                      const Gap(14),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: themeC.isDarkMode.value
                              ? Colors.grey.shade900
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.access_time_filled_sharp,
                              size: 64,
                            ),
                            Text(DateTimeUtils.getCurrentDay(),
                                style: TextStyle(
                                    color: themeC.isDarkMode.value
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade900,
                                    fontWeight: FontWeight.bold)),
                            Obx(() => Text(controller.currentTime.value,
                                style: TextStyle(
                                    color: themeC.isDarkMode.value
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade900,
                                    fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.SETTINGS),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: themeC.isDarkMode.value
                                ? Colors.grey.shade900
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.settings_sharp,
                                size: 64,
                              ),
                              Text('Settings',
                                  style: TextStyle(
                                      color: themeC.isDarkMode.value
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade900,
                                      fontWeight: FontWeight.bold)),
                              Text('----------',
                                  style: TextStyle(
                                      color: themeC.isDarkMode.value
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade900,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      // const Spacer(),
                      const Gap(14),
                      GestureDetector(
                        onTap: () => controller.exitApp(),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: themeC.isDarkMode.value
                                ? Colors.grey.shade900
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.exit_to_app_rounded,
                                size: 64,
                              ),
                              Text('Exit the App',
                                  style: TextStyle(
                                      color: themeC.isDarkMode.value
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade900,
                                      fontWeight: FontWeight.bold)),
                              Text('----------',
                                  style: TextStyle(
                                      color: themeC.isDarkMode.value
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade900,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        appBar: AppBar(
          title: const Text('DiceTodo'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Obx(() => Icon(themeC.isDarkMode.value
                  ? Icons.dark_mode
                  : Icons.light_mode)),
              onPressed: () {
                themeC.toggleTheme();
              },
            ),
          ],
        ),
        body: Obx(() => ListView.builder(
              itemCount: controller.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: controller.toDoList[index][0],
                  taskCompleted: controller.toDoList[index][1],
                  onChanged: (value) => controller.checkBoxChanged(index),
                  deleteFunction: (context) => controller.deleteTask(index),
                );
              },
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ));
  }
}
