import 'package:get/get.dart';
import 'package:taskaia/model/task.dart';
import '../../utils/constants.dart';
import '../../utils/helper/database_helper.dart';

class TasksController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;
  final DataBaseHelper dbHelper = DataBaseHelper.dbHelper;

  Future<void> insertTask({required Task task}) async {
    await dbHelper.insertOnDatabase(table: taskTableKey, databaseModel: task);
    await getTasks();
  }

  Future<void> getTasks() async {
    this.tasks.clear();
    List<Map<String, dynamic>> jsonData =
        await dbHelper.getFromDatabase(table: taskTableKey);
    List<Task> tasks =
        jsonData.map((element) => Task.fromJson(element)).toList();
    this.tasks.addAll(tasks);
  }

  Future<void> updateTask({required Task task}) async {
    await dbHelper.updateOnDatabase(
        table: taskTableKey, tableId: taskIdKey, databaseModel: task);
    await getTasks();
  }

  Future<void> updateRowTask({required int id}) async {
    await dbHelper.rowUpdateOnDatabase(
        table: taskTableKey, tableId: taskIdKey, id: id);
    await getTasks();
  }

  Future<void> deleteTask({required int id}) async {
    await dbHelper.deleteFromDatabase(
        table: taskTableKey, tableId: taskIdKey, id: id);
    await getTasks();
  }

  @override
  void onInit() {
    super.onInit();
    getTasks();
  }
}
