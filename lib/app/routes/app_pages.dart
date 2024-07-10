// ignore_for_file: constant_identifier_names
import 'package:dice_todo/app/modules/settings/bindings/setting_binding.dart';
import 'package:dice_todo/app/modules/settings/view/settings_view.dart';
import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingBinding(),
    ),
  ];
}
