import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskaia/model/memory.dart';

import '../../utils/constants.dart';
import '../../utils/helper/database_helper.dart';

class MemoriesController extends GetxController {
  RxInt stepIndex = 0.obs;

  void onNextStep() {
    stepIndex++;
  }

  void onPreviousStep() {
    stepIndex--;
  }

  void onSelectStep(int value) {
    stepIndex.value = value;
  }

  RxList<Memory> memories = <Memory>[].obs;

  final DataBaseHelper dbHelper = DataBaseHelper.dbHelper;

  Future<void> insertMemory({required Memory memory}) async {
    await dbHelper.insertOnDatabase(
        table: memoryTableKey, databaseModel: memory);
  }

  Future<void> getMemories() async {
    List<Map<String, dynamic>> jsonData =
        await dbHelper.getFromDatabase(table: memoryTableKey);
    List<Memory> memories =
        jsonData.map((element) => Memory.fromJson(element)).toList();
    memories.addAll(memories);
  }

  Future<void> updateMemory({required Memory memory}) async {
    await dbHelper.updateOnDatabase(
        table: memoryTableKey, databaseModel: memory);
  }

  Future<void> deleteMemory({required int id}) async {
    await dbHelper.deleteFromDatabase(table: memoryTableKey, id: id);
  }

  // List<Memory> memories = [
  //   Memory(
  //     id: 1,
  //     title: 'Step 1',
  //     memory:
  //         'MediaQuery. I am a noob, so would really like to understand. Otherwise,',
  //     dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
  //   ),
  //   Memory(
  //     id: 2,
  //     title: 'Step 2',
  //     memory:
  //         'MediaQuery. I am a noob, so would really like to understand. Otherwise,',
  //     dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
  //   ),
  //   Memory(
  //     id: 3,
  //     title: 'Step 3',
  //     memory:
  //         'MediaQuery. I am a noob, so would really like to understand. Otherwise,',
  //     dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
  //   ),
  //   Memory(
  //     id: 4,
  //     title: 'Step 4',
  //     memory:
  //         'MediaQuery. I am a noob, so would really like to understand. Otherwise, MediaQuery. I am a noob, so would really like to understand. Otherwise,',
  //     dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
  //   ),
  //   Memory(
  //     id: 5,
  //     title: 'Step 5',
  //     memory:
  //         'MediaQuery. I am a noob, so would really like to understand. Otherwise, MediaQuery. I am a noob, so would really like to understand. Otherwise,MediaQuery. I am a noob, so would really like to understand. Otherwise,',
  //     dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
  //   ),
  // ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController memoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final DateTime currentDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    dateController.text = DateFormat.yMMMd().format(currentDate).toString();
  }

  @override
  void onClose() {
    titleController.dispose();
    memoryController.dispose();
    dateController.dispose();
    super.onClose();
  }
}
