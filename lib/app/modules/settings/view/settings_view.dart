import 'package:dice_todo/app/modules/settings/controllers/setting_controller.dart';
import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SettingsView extends GetView<SettingController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
              tileColor: themeC.isDarkMode.value
                  ? Colors.grey.shade900
                  : Colors.grey.shade300,
              title: const Text(
                'Language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              trailing: const Icon(Icons.arrow_forward_sharp),
              leading: const Icon(Icons.language_sharp),
            ),
            const Gap(12),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
              tileColor: themeC.isDarkMode.value
                  ? Colors.grey.shade900
                  : Colors.grey.shade300,
              title: const Text(
                'Font',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              trailing: const Icon(Icons.arrow_forward_sharp),
              leading: const Icon(Icons.font_download_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
