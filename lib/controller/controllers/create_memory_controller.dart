import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../model/memory.dart';

class CreateMemoryController extends GetxController {
  final bool? isCreated;
  final Memory? memory;

  CreateMemoryController({this.isCreated, this.memory});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController memoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  late DateTime currentDate = DateTime.now();
  int currentColor = 0;

  void onColorChange(int value) {
    currentColor = value;
    update();
  }

  void initTextControllers() {
    dateController.text = DateFormat.yMMMd().format(currentDate).toString();
  }

  void detectCurrentTextControllers() {
    titleController.text = memory!.title;
    currentColor = memory!.color;
  }

  void onDateChange({DateTime? pickedDatetime}) {
    if (pickedDatetime != null) {
      currentDate = pickedDatetime;
    } else {
      currentDate = DateTime.now();
    }
    dateController.text = DateFormat.yMMMd().format(currentDate).toString();
  }

  @override
  void onInit() {
    super.onInit();
    if (isCreated == null || isCreated == false) {
      initTextControllers();
    } else {
      detectCurrentTextControllers();
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    memoryController.dispose();
    dateController.dispose();
    super.onClose();
  }
}
