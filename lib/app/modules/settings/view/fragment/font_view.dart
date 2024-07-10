import 'package:dice_todo/app/modules/settings/controllers/setting_controller.dart';
import 'package:dice_todo/app/utils/snackbar/snackbar.dart';
import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FFontView extends GetView<SettingController> {
  const FFontView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
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
                      title: const Text('Montserrat'),
                      leading: Radio<String>(
                        value: 'Montserrat',
                        groupValue: themeC.selectedFont.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeFont(value);
                          }
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Raleway'),
                      leading: Radio<String>(
                        value: 'Raleway',
                        groupValue: themeC.selectedFont.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeFont(value);
                          }
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Nunito'),
                      leading: Radio<String>(
                        value: 'Nunito',
                        groupValue: themeC.selectedFont.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeFont(value);
                          }
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Poppins'),
                      leading: Radio<String>(
                        value: 'Poppins',
                        groupValue: themeC.selectedFont.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeFont(value);
                          }
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Roboto'),
                      leading: Radio<String>(
                        value: 'Roboto',
                        groupValue: themeC.selectedFont.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeFont(value);
                          }
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Open Sans'),
                      leading: Radio<String>(
                        value: 'Open Sans',
                        groupValue: themeC.selectedFont.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeFont(value);
                          }
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Lato'),
                      leading: Radio<String>(
                        value: 'Lato',
                        groupValue: themeC.selectedFont.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeFont(value);
                          }
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Comic Neue'),
                      leading: Radio<String>(
                        value: 'Comic Neue',
                        groupValue: themeC.selectedFont.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            themeC.changeFont(value);
                          }
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        themeC.saveFont();
                        Get.back();
                        cSnackBar('info', 'Font Changed Successfully');
                      },
                      child: const Text('Confirm Font'),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
