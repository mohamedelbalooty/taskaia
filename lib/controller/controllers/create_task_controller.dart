import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../model/task.dart';

class CreateTaskController extends GetxController {
  final bool? isCreated;
  final Task? task;

  CreateTaskController({this.isCreated, this.task});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController reminderController = TextEditingController();
  final TextEditingController repeatController = TextEditingController();

  late DateTime currentDate = DateTime.now();
  late String startTime = DateFormat.jm().format(DateTime.now()).toString();
  late String endTime = DateFormat.jm()
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  final List<int> reminderList = [5, 10, 15, 20];
  final List<String> repeatList = ['none'.tr, 'daily'.tr, 'weekly'.tr, 'monthly'.tr];
  String currentRepeat = 'none'.tr;
  int currentReminder = 5;
  int currentColor = 0;

  void onColorChange(int value){
    currentColor = value;
    update();
  }

  void onReminderChange(String value) {
    currentReminder = int.parse(value);
    reminderController.text = currentReminder.toString();
  }

  void onRepeatChange(String value) {
    currentRepeat = value;
    repeatController.text = currentRepeat;
  }

  void onDateChange({DateTime? pickedDatetime}) {
    if (pickedDatetime != null) {
      currentDate = pickedDatetime;
    } else {
      currentDate = DateTime.now();
    }
    dateController.text = DateFormat.yMMMd().format(currentDate).toString();
  }

  void onStartTimeChange(BuildContext context, {TimeOfDay? pickedTime}) {
    if (pickedTime != null) {
      startTime = pickedTime.format(context);
    } else {
      startTime = DateFormat.jm().format(DateTime.now()).toString();
    }
    startTimeController.text = startTime;
  }

  void onEnfTimeChange(BuildContext context, {TimeOfDay? pickedTime}) {
    if (pickedTime != null) {
      endTime = pickedTime.format(context);
    } else {
      startTime = DateFormat.jm()
          .format(DateTime.now().add(const Duration(minutes: 15)))
          .toString();
    }
    endTimeController.text = endTime;
  }

  void initTextControllers() {
    dateController.text = DateFormat.yMMMd().format(currentDate).toString();
    startTimeController.text = startTime;
    endTimeController.text = endTime;
    repeatController.text = currentRepeat;
    reminderController.text = currentReminder.toString();
  }

  void detectCurrentTextControllers() {
    titleController.text = task!.title;
    taskController.text = task!.content;
    dateController.text = task!.dateTime;
    startTimeController.text = task!.startTime;
    endTimeController.text = task!.endTime;
    repeatController.text = task!.repeat;
    reminderController.text = task!.remind.toString();
    currentColor = task!.color;
  }

  @override
  void onInit() {
    super.onInit();
    if(isCreated == null || isCreated == false){
      initTextControllers();
    }else{
      detectCurrentTextControllers();
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    taskController.dispose();
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    reminderController.dispose();
    repeatController.dispose();
    super.onClose();
  }
}
