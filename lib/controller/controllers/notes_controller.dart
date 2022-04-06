import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../model/note.dart';
import '../../utils/constants.dart';
import '../../utils/helper/database_helper.dart';

class NotesController extends GetxController {
  RxList<Note> notes = <Note>[].obs;

  final DataBaseHelper dbHelper = DataBaseHelper.dbHelper;

  Future<void> insertNotes({required Note note}) async {
    await dbHelper.insertOnDatabase(table: noteTableKey, databaseModel: note);
  }

  Future<void> getNotes() async {
    List<Map<String, dynamic>> jsonData =
        await dbHelper.getFromDatabase(table: noteTableKey);
    List<Note> memories =
        jsonData.map((element) => Note.fromJson(element)).toList();
    memories.addAll(memories);
  }

  Future<void> updateNote({required Note note}) async {
    await dbHelper.updateOnDatabase(table: noteTableKey, databaseModel: note);
  }

  Future<void> deleteNote({required int id}) async {
    await dbHelper.deleteFromDatabase(table: noteTableKey, id: id);
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
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
    noteController.dispose();
    dateController.dispose();
    super.onClose();
  }
}
