import 'package:get/get.dart';
import '../../model/task.dart';
import '../controllers/create_task_controller.dart';

class CreateTaskBinding extends Bindings {
  final bool? isCreated;
  final Task? task;

  CreateTaskBinding({this.isCreated, this.task});

  @override
  void dependencies() {
    Get.put(CreateTaskController(isCreated: isCreated, task: task));
  }
}
