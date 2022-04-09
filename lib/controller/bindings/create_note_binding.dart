import 'package:get/get.dart';
import '../../model/note.dart';
import '../controllers/create_note_controller.dart';

class CreateNoteBinding extends Bindings {
  final bool? isCreated;
  final Note? note;

  CreateNoteBinding({this.isCreated, this.note});

  @override
  void dependencies() {
    Get.put(CreateNoteController());
  }
}
