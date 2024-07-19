import 'package:dice_todo/app/data/hive/hive_storage.dart';
import 'package:dice_todo/app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxBool isConfirm = false.obs;
  RxString selectedFont = ''.obs;
  RxString selectedLanguage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedLanguage.value =
        HiveLStorage.loadBox('selectedLanguage', defaultValue: 'en_US');
    Get.updateLocale(Locale(selectedLanguage.value.split('_')[0],
        selectedLanguage.value.split('_')[1]));
    isDarkMode.value = HiveLStorage.loadBox('isDarkMode', defaultValue: false);
    selectedFont.value =
        HiveLStorage.loadBox('selectedFont', defaultValue: 'Lato');
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
    Get.updateLocale(
        Locale(languageCode.split('_')[0], languageCode.split('_')[1]));
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    HiveLStorage.updateBox('isDarkMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeFont(String font) {
    selectedFont.value = font;
  }

  void saveFont() {
    HiveLStorage.updateBox('selectedFont', selectedFont.value);
  }

  void saveLanguage() {
    HiveLStorage.updateBox('selectedLanguage', selectedLanguage.value);
  }

  ThemeData getLightTheme() {
    return ThemeUtils.getLightTheme(selectedFont.value);
  }

  ThemeData getDarkTheme() {
    return ThemeUtils.getDarkTheme(selectedFont.value);
  }
}
