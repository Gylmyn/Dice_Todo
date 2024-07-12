import 'package:dice_todo/app/modules/settings/controllers/setting_controller.dart';
import 'package:dice_todo/app/utils/snackbar/snackbar.dart';
import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FLanguageView extends GetView<SettingController> {
  const FLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('change_language'.tr),
        centerTitle: true,
        actions: const [],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: themeC.isDarkMode.value
                  ? Colors.grey.shade900
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text(
                        'Preview Font : ${themeC.selectedFont.value}',
                        style: TextStyle(
                          fontSize: 16,
                          color: themeC.isDarkMode.value
                              ? Colors.grey.shade300
                              : Colors.grey.shade900,
                        ),
                      )),
                  Text(
                    '< Hallo World />',
                    style: TextStyle(
                      fontSize: 24,
                      color: themeC.isDarkMode.value
                          ? Colors.grey.shade300
                          : Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView(
                  children: [
                    ListTile(
                      title: const Text('English'),
                      leading: Radio<String>(
                        value: 'en_US',
                        groupValue: themeC.selectedLanguage.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeLanguage(value);
                          }
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Bahasa Indonesia'),
                      leading: Radio<String>(
                        value: 'id_ID',
                        groupValue: themeC.selectedLanguage.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeLanguage(value);
                          }
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        themeC.saveLanguage();
                        Get.back();
                        cSnackBar('notification'.tr,
                            '${'change_language'.tr} ${'successfully'.tr}');
                      },
                      child: Text('confirm'.tr),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
