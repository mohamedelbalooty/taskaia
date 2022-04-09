import 'package:get/get.dart';
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
    await getMemories();
  }

  Future<void> getMemories() async {
    this.memories.clear();
    List<Map<String, dynamic>> jsonData =
        await dbHelper.getFromDatabase(table: memoryTableKey);
    List<Memory> memories =
        jsonData.map((element) => Memory.fromJson(element)).toList();
    this.memories.addAll(memories);
  }

  Future<void> updateMemory({required Memory memory}) async {
    await dbHelper.updateOnDatabase(
        table: memoryTableKey, tableId: memoryIdKey, databaseModel: memory);
    await getMemories();
  }

  Future<void> deleteMemory({required int id}) async {
    await dbHelper.deleteFromDatabase(
        table: memoryTableKey, tableId: memoryIdKey, id: id);
    await getMemories();
  }

  @override
  void onInit() {
    super.onInit();
    getMemories();
  }

}
