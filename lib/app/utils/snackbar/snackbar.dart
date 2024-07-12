import 'package:get/get.dart';

void cSnackBar(String title, String message) {
  Get.snackbar(title, message, snackPosition: SnackPosition.TOP);
}
