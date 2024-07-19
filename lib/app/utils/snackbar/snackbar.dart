import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void cSnackBar(String title, String message,
    {VoidCallback? onPressed,
    SnackPosition? snackPosition,
    Duration? duration}) {
  final themeC = Get.find<ThemeController>();
  Get.snackbar(
    title,
    message,
    snackPosition: snackPosition,
    showProgressIndicator: true,
    duration: duration,
    mainButton: TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(themeC.isDarkMode.value
              ? Colors.grey.shade900
              : Colors.grey.shade300)),
      child: Text(
        'confirm'.tr,
        style: TextStyle(
            color: themeC.isDarkMode.value ? Colors.white : Colors.black),
      ),
    ),
  );
}

void cSnackBar2(
  String title,
  String message, {
  SnackPosition? snackPosition,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: snackPosition,
  );
}
