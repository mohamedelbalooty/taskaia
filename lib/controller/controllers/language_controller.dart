import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskaia/utils/helper/storage_helper.dart';
import '../../utils/constants.dart';

class LanguageController {
  String get localLang => StorageHelper.getStringData(key: languageKey) ?? Get.deviceLocale!.languageCode;

  void onChangeLang(String language) {
    Get.updateLocale(Locale(language));
    StorageHelper.setStringData(key: languageKey, value: language);
  }
}
