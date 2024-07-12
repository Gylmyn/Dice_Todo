import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ToDoTile extends GetView<ThemeController> {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?) onChanged;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Obx(() => Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: controller.isDarkMode.value
                    ? Colors.grey.shade900
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Obx(() => Row(
                    children: [
                      // checkbox
                      Checkbox(
                        value: taskCompleted,
                        onChanged: onChanged,
                        activeColor: controller.isDarkMode.value
                            ? Colors.grey.shade300
                            : Colors.grey.shade900,
                      ),

                      // task name
                      Container(
                        constraints: const BoxConstraints(maxWidth: 220),
                        child: Text(
                          taskName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decorationThickness: 4,
                            decorationStyle: TextDecorationStyle.wavy,
                            decorationColor: controller.isDarkMode.value
                                ? Colors.grey.shade300
                                : Colors.grey.shade900,
                            color: controller.isDarkMode.value
                                ? Colors.grey.shade300
                                : Colors.grey.shade900,
                            decoration: taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  )),
            )),
      ),
    );
  }
}
