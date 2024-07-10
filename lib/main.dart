import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:dice_todo/app/utils/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeC = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          theme: themeC.getLightTheme(),
          darkTheme: themeC.getDarkTheme(),
          themeMode: themeC.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          title: "Dice Todo",
          translations: Messages(),
          locale: Locale(themeC.selectedLanguage.value.split('_')[0],
              themeC.selectedLanguage.value.split('_')[1]),
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ));
  }
}
