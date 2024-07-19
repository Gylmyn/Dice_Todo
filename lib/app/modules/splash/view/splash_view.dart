import 'package:dice_todo/app/modules/splash/controllers/splash_controller.dart';
import 'package:dice_todo/app/utils/theme/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
        body: FutureBuilder(
      future: controller.splashC(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Stack(
                  children: [
                    Positioned(
                      left: 50,
                      right: 50,
                      bottom: 50,
                      child: Container(
                        width: 270,
                        height: 270,
                        decoration: BoxDecoration(
                            color: themeC.isDarkMode.value
                                ? Colors.grey.shade900
                                : Colors.grey.shade300,
                            shape: BoxShape.circle),
                      ),
                    ),
                    Image.asset('assets/logo-img.png'),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('ToDice',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: themeC.isDarkMode.value
                              ? Colors.grey.shade300
                              : Colors.grey.shade900,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('by',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: themeC.isDarkMode.value
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade900,
                            )),
                        const Gap(5),
                        Text('Gylmyn',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: themeC.isDarkMode.value
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade900,
                            )),
                      ],
                    ),
                    const Gap(12)
                  ],
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    ));
  }
}
