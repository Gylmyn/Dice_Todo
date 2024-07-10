import 'package:dice_todo/app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxString selectedFont = ''.obs;
  RxString selectedLanguage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedLanguage.value =
        Hive.box('myBox').get('selectedLanguage', defaultValue: 'en_US');
    Get.updateLocale(Locale(selectedLanguage.value.split('_')[0],
        selectedLanguage.value.split('_')[1]));
    isDarkMode.value = Hive.box('myBox').get('isDarkMode', defaultValue: false);
    selectedFont.value =
        Hive.box('myBox').get('selectedFont', defaultValue: 'Lato');
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
    Hive.box('myBox').put('selectedLanguage', languageCode);
    Get.updateLocale(
        Locale(languageCode.split('_')[0], languageCode.split('_')[1]));
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Hive.box('myBox').put('isDarkMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeFont(String font) {
    selectedFont.value = font;
  }

  void saveFont() {
    Hive.box('myBox').put('selectedFont', selectedFont.value);
  }

  ThemeData getLightTheme() {
    return ThemeUtils.getLightTheme(selectedFont.value);
  }

  ThemeData getDarkTheme() {
    return ThemeUtils.getDarkTheme(selectedFont.value);
  }
}
