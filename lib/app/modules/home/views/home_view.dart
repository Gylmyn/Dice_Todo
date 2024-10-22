import 'package:dice_todo/app/components/dialog.dart';
import 'package:dice_todo/app/components/label.dart';
import 'package:dice_todo/app/components/text_field.dart';
import 'package:dice_todo/app/components/todo_tile.dart';
import 'package:dice_todo/app/routes/app_pages.dart';
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
      Get.bottomSheet(
          backgroundColor: themeC.isDarkMode.value
              ? Colors.grey.shade800
              : Colors.grey.shade200,
          DialogBox(
            taskcontroller: controller.taskController,
            onSave: controller.saveNewTask,
            onCancel: () => Get.back(),
          ));
    }

    return Scaffold(
        drawer: _buildDrawer(themeC, controller),
        appBar: _buildAppBar(themeC),
        body: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const MyLabel(
                //   label: 'Search',
                // ),
                const Gap(6),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 25.0,
                    right: 25,
                  ),
                  child: MyTextField(
                    hintText: 'Search The Task... ',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                const Gap(20),
                const MyLabel(
                  label: 'Task',
                ),
                const Gap(6),
                Expanded(
                    child: controller.toDoList.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.toDoList.length,
                            itemBuilder: (context, index) {
                              return ToDoTile(
                                taskName: controller.toDoList[index][0],
                                taskCompleted: controller.toDoList[index][1],
                                onChanged: (value) =>
                                    controller.checkBoxChanged(index),
                                deleteFunction: (context) =>
                                    controller.deleteTask(index),
                              );
                            },
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.menu_book_rounded,
                                  size: 60,
                                ),
                                const Gap(6),
                                Text(
                                  'No Task Found',
                                  style: TextStyle(
                                    color: themeC.isDarkMode.value
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade900,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          )),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          // backgroundColor: Colors.amberAccent,
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ));
  }
}

AppBar _buildAppBar(ThemeController themeC) {
  return AppBar(
    title: const Text('ToDice'),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Obx(() =>
            Icon(themeC.isDarkMode.value ? Icons.dark_mode : Icons.light_mode)),
        onPressed: () {
          themeC.toggleTheme();
        },
      ),
    ],
  );
}

Drawer _buildDrawer(ThemeController themeC, HomeController controller) {
  return Drawer(
    width: 320,
    shape: const BeveledRectangleBorder(),
    child: Obx(() => ListView(
          children: [
            const Gap(12),
            Container(
                height: 300,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: themeC.isDarkMode.value
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      image: AssetImage('assets/logo-img.png'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                        'ToDice',
                        style: TextStyle(
                          fontSize: 24,
                          color: themeC.isDarkMode.value
                              ? Colors.grey.shade300
                              : Colors.grey.shade900,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Text(
                        'v1.0.0',
                        style: TextStyle(
                          fontSize: 16,
                          color: themeC.isDarkMode.value
                              ? Colors.grey.shade300
                              : Colors.grey.shade900,
                        ),
                      ),
                    ),
                  ],
                )),
            const Gap(12),
            SizedBox(
              height: 160,
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 6),
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 20),
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
                          size: 60,
                        ),
                        const Gap(6),
                        Text('calender'.tr,
                            style: TextStyle(
                                color: themeC.isDarkMode.value
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade900,
                                fontSize: 20)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 20),
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
                          size: 60,
                        ),
                        const Gap(6),
                        Text('clock'.tr,
                            style: TextStyle(
                                color: themeC.isDarkMode.value
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade900,
                                fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(12),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.SETTINGS),
              child: Container(
                decoration: BoxDecoration(
                  color: themeC.isDarkMode.value
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  leading: const Icon(
                    Icons.settings_sharp,
                    size: 24,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_sharp,
                    size: 24,
                  ),
                  title: Text('settings'.tr),
                ),
              ),
            ),
            const Gap(12),
            GestureDetector(
              onTap: () => controller.exitApp(),
              child: Container(
                decoration: BoxDecoration(
                  color: themeC.isDarkMode.value
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  leading: const Icon(
                    Icons.sensor_door_rounded,
                    size: 24,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_sharp,
                    size: 24,
                  ),
                  title: Text('exit'.tr),
                ),
              ),
            ),
            const Gap(12),
          ],
        )),
  );
}
