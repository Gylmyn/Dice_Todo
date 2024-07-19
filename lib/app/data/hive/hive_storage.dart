import 'package:hive_flutter/hive_flutter.dart';

class HiveLStorage {
  static final Box<dynamic> _refrenceBox = Hive.box('myBox');

  static dynamic loadBox(String key, {dynamic defaultValue}) {
    final dynamic data = _refrenceBox.get(key, defaultValue: defaultValue);
    return data;
  }

  static dynamic updateBox(String key, dynamic value) {
    final dynamic data = _refrenceBox.put(key, value);
    return data;
  }
}
