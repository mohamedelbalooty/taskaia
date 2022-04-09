import 'package:get/get.dart';
import '../../model/note.dart';
import '../../utils/constants.dart';
import '../../utils/helper/database_helper.dart';

class NotesController extends GetxController {
  RxList<Note> notes = <Note>[].obs;

  final DataBaseHelper dbHelper = DataBaseHelper.dbHelper;

  Future<void> insertNotes({required Note note}) async {
    await dbHelper.insertOnDatabase(table: noteTableKey, databaseModel: note);
    await getNotes();
  }

  Future<void> getNotes() async {
    this.notes.clear();
    List<Map<String, dynamic>> jsonData =
        await dbHelper.getFromDatabase(table: noteTableKey);
    List<Note> notes =
        jsonData.map((element) => Note.fromJson(element)).toList();
    this.notes.addAll(notes);
  }

  Future<void> updateNote({required Note note}) async {
    await dbHelper.updateOnDatabase(
        table: noteTableKey, tableId: noteIdKey, databaseModel: note);
    await getNotes();
  }

  Future<void> deleteNote({required int id}) async {
    await dbHelper.deleteFromDatabase(
        table: noteTableKey, tableId: noteIdKey, id: id);
    await getNotes();
  }
  @override
  void onInit() {
    super.onInit();
    getNotes();
  }
}
