import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends GetView<ThemeController> {
  const MyButton({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
    this.useIcon = false,
  });
  final String? text;
  final Icon? icon;
  final VoidCallback? onPressed;
  final bool useIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          decoration: BoxDecoration(
            color: controller.isDarkMode.value
                ? Colors.grey.shade900
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: useIcon
              ? icon!
              : Text(text!,
                  style: TextStyle(
                      color: controller.isDarkMode.value
                          ? Colors.white
                          : Colors.black)),
        ));
  }
}
