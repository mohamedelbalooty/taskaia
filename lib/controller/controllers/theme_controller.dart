import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskaia/utils/helper/storage_helper.dart';
import '../../utils/constants.dart';

class ThemeController {
  bool isDarkMode() => StorageHelper.getBoolData(key: darkModeKey);

  ThemeMode get themeMode => isDarkMode() ? ThemeMode.dark : ThemeMode.light;

  void changeThemeMode() {
    if (isDarkMode()) {
      Get.changeThemeMode(ThemeMode.light);
      StorageHelper.setBoolData(key: darkModeKey, value: false);
    }else{
      Get.changeThemeMode(ThemeMode.dark);
      StorageHelper.setBoolData(key: darkModeKey, value: true);
    }
  }
}
