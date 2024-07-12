import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:dice_todo/app/utils/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  Get.lazyPut<ThemeController>(() => ThemeController());
  runApp(const Main());
}

class Main extends GetView<ThemeController> {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          theme: controller.getLightTheme(),
          darkTheme: controller.getDarkTheme(),
          themeMode: _theTheme(),
          debugShowCheckedModeBanner: false,
          title: "Dice Todo",
          translations: Messages(),
          locale: _theLocale(),
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ));
  }

  ThemeMode _theTheme() {
    return controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  Locale _theLocale() {
    return Locale(controller.selectedLanguage.value.split('_')[0],
        controller.selectedLanguage.value.split('_')[1]);
  }
}
