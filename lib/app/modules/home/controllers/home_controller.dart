import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxList toDoList = [].obs;
  RxList toDoSugesstion =
      ['Do Homework ?', 'Go To Campus ?', 'Go Healing ?'].obs;
  late TextEditingController taskController;
  RxString currentTime = ''.obs;

  @override
  void onInit() {
    super.onInit();
    taskController = TextEditingController();
    updateCurrentTime();
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      updateCurrentTime();
    });
    if (_myBox.get("TODOLIST") == null) {
      createInitialData();
    } else {
      loadData();
    }
  }

  @override
  void onClose() {
    taskController.dispose();
    super.onClose();
  }

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList.value = [
      ["Progress Let's Go", false],
    ];
  }

  void exitApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }

  void updateCurrentTime() {
    final now = DateTime.now();
    currentTime.value = DateFormat('HH:mm:ss').format(now);
  }

  // load the data from database
  void loadData() {
    toDoList.value = _myBox.get("TODOLIST");
  }

  void accSugesstion(int index) {
    taskController.text = toDoSugesstion[index];
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList.toList());
  }

  void checkBoxChanged(int index) {
    toDoList[index][1] = !toDoList[index][1];
    toDoList.refresh();
    updateDataBase();
  }

  void saveNewTask() {
    toDoList.add([taskController.text, false]);
    updateDataBase();
    taskController.clear();
    Get.back();
  }

  void deleteTask(int index) {
    toDoList.removeAt(index);
    updateDataBase();
  }
}
