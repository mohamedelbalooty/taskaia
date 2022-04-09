import 'package:get/get.dart';
import '../../model/memory.dart';
import '../controllers/create_memory_controller.dart';

class CreateMemoryBinding extends Bindings {
  final bool? isCreated;
  final Memory? memory;

  CreateMemoryBinding({this.isCreated, this.memory});

  @override
  void dependencies() {
    Get.put(CreateMemoryController(isCreated: isCreated, memory: memory));
  }
}
