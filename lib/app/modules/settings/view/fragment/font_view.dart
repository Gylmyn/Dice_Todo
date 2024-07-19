import 'package:dice_todo/app/modules/settings/controllers/setting_controller.dart';
import 'package:dice_todo/app/utils/snackbar/snackbar.dart';
import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FFontView extends GetView<SettingController> {
  const FFontView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                  themeC.isConfirm.value
                      ? cSnackBar2('notification'.tr,
                          '${'change_font'.tr} ${'successfully'.tr}',
                          snackPosition: SnackPosition.BOTTOM)
                      : null;
                  themeC.isConfirm.value = false;
                },
                icon: const Icon(Icons.arrow_back)),
            title: Text('change_font'.tr),
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
                            '${'preview'.tr} Font : ${themeC.selectedFont.value}',
                            style: TextStyle(
                              fontSize: 16,
                              color: themeC.isDarkMode.value
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade900,
                            ),
                          )),
                      const Gap(4),
                      Text(
                        'hallo_world'.tr,
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
              const Gap(16),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.fontsValue.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String fontValue = controller.fontsValue[index];
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
                                value: fontValue,
                                groupValue: themeC.selectedFont.value,
                                onChanged: (String? value) {
                                  if (value != null) {
                                    themeC.changeFont(value);
                                    themeC.isConfirm.value = true;
                                    themeC.saveFont();
                                  }
                                },
                              ),
                              Text(fontValue,
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
        ));
  }
}
