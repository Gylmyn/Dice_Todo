import 'package:dice_todo/app/modules/settings/controllers/setting_controller.dart';
import 'package:dice_todo/app/utils/snackbar/snackbar.dart';
import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FLanguageView extends GetView<SettingController> {
  const FLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
              themeC.isConfirm.value
                  ? cSnackBar2('notification'.tr,
                      '${'change_language'.tr} ${'successfully'.tr}',
                      snackPosition: SnackPosition.BOTTOM)
                  : null;
              themeC.isConfirm.value = false;
            },
            icon: const Icon(Icons.arrow_back)),
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
              child: Text(
                'hallo_world'.tr,
                style: TextStyle(
                  fontSize: 24,
                  color: themeC.isDarkMode.value
                      ? Colors.grey.shade300
                      : Colors.grey.shade900,
                ),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: ListView.builder(
              itemCount: controller.languagesValue.length,
              itemBuilder: (BuildContext context, int index) {
                final List<String> langValue = controller.languagesValue[index];
                return Obx(() => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      height: 80,
                      decoration: BoxDecoration(
                        color: themeC.isDarkMode.value
                            ? Colors.grey.shade900
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Radio<String>(
                            value: langValue[1],
                            groupValue: themeC.selectedLanguage.value,
                            onChanged: (String? value) {
                              if (value != null) {
                                themeC.changeLanguage(value);
                                themeC.isConfirm.value = true;
                                themeC.saveLanguage();
                              }
                            },
                          ),
                          Text(langValue[0],
                              style: TextStyle(
                                  color: themeC.isDarkMode.value
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18)),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
