import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Muat preferensi tema dari Hive saat inisialisasi
    isDarkMode.value = Hive.box('myBox').get('isDarkMode', defaultValue: false);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Hive.box('myBox').put('isDarkMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
