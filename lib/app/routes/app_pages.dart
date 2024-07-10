// ignore_for_file: constant_identifier_names
import 'package:dice_todo/app/modules/settings/bindings/setting_binding.dart';
import 'package:dice_todo/app/modules/settings/view/fragment/font_view.dart';
import 'package:dice_todo/app/modules/settings/view/fragment/language_view.dart';
import 'package:dice_todo/app/modules/settings/view/settings_view.dart';
import 'package:dice_todo/app/modules/home/bindings/home_binding.dart';
import 'package:dice_todo/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
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
    GetPage(
      name: _Paths.FLANGUAGE,
      page: () => const FLanguageView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.FFONT,
      page: () => const FFontView(),
      binding: SettingBinding(),
    ),
  ];
}
