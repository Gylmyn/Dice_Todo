import 'package:hive_flutter/hive_flutter.dart';

class HiveLStorage {
  static final Box<dynamic> _myBox = Hive.box('mybox');

  static void loadData(String key) {
    _myBox.get(key);
  }
}
