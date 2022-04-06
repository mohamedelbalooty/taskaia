import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskaia/model/task.dart';
import '../../utils/constants.dart';
import '../../utils/helper/database_helper.dart';

class TasksController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;

  final DataBaseHelper dbHelper = DataBaseHelper.dbHelper;

  Future<void> insertTask({required Task task}) async {
    await dbHelper.insertOnDatabase(table: taskTableKey, databaseModel: task);
  }

  Future<void> getTasks() async {
    List<Map<String, dynamic>> jsonData =
        await dbHelper.getFromDatabase(table: taskTableKey);
    List<Task> tasks =
        jsonData.map((element) => Task.fromJson(element)).toList();
    tasks.addAll(tasks);
  }

  Future<void> updateTask({required Task task})async{
    await dbHelper.updateOnDatabase(table: taskTableKey, databaseModel: task);
  }

  Future<void> deleteTask({required int id}) async {
    await dbHelper.deleteFromDatabase(table: taskTableKey, id: id);
  }


  final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController reminderController = TextEditingController();
  final TextEditingController repeatController = TextEditingController();

  final DateTime currentDate = DateTime.now();
  final String startTime = DateFormat.jm().format(DateTime.now()).toString();
  final String endTime = DateFormat.jm()
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  final List<int> reminderList = [5, 10, 15, 20];
  final List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  String currentRepeat = 'None';
  int currentReminder = 5;

  void onReminderChange(String value) {
    currentReminder = int.parse(value);
    reminderController.text = currentReminder.toString();
  }

  void onRepeatChange(String value) {
    currentRepeat = value;
    repeatController.text = currentRepeat;
  }

  void onDateChange() {}

  void onStartTimeChange() {}

  void onEnfTimeChange() {}

  @override
  void onInit() {
    super.onInit();
    dateController.text = DateFormat.yMMMd().format(currentDate).toString();
    startTimeController.text = startTime;
    endTimeController.text = endTime;
    repeatController.text = currentRepeat;
    reminderController.text = currentReminder.toString();
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
