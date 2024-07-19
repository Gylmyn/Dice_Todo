import 'package:get/get.dart';

class SettingController extends GetxController {
  RxList<dynamic> fontsValue = [
    'Roboto',
    'Open Sans',
    'Lato',
    'Comic Neue',
    'Montserrat',
    'Nunito',
    'Raleway',
    'Poppins',
  ].obs;

  RxList<dynamic> languagesValue = [
    ['English', 'en_US'],
    ['Indonesia', 'id_ID'],
  ].obs;
}
