import 'package:dice_todo/app/modules/settings/controllers/setting_controller.dart';
import 'package:dice_todo/app/routes/app_pages.dart';
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
        title: Text('settings'.tr),
        centerTitle: true,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(() => Column(
              children: [
                ListTile(
                  onTap: () => Get.toNamed(Routes.FLANGUAGE),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                  tileColor: themeC.isDarkMode.value
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  title: Text(
                    'language'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_sharp),
                  leading: const Icon(Icons.language_sharp),
                ),
                const Gap(12),
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  onTap: () => Get.toNamed(Routes.FFONT),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                  tileColor: themeC.isDarkMode.value
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  title: const Text(
                    'Font',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_sharp),
                  leading: const Icon(Icons.font_download_outlined),
                ),
              ],
            )),
      ),
    );
  }
}
