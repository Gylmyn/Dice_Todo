import 'package:dice_todo/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashC();
    super.onInit();
  }

  Future<void> splashC() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.offNamed(Routes.HOME);
  }
}
