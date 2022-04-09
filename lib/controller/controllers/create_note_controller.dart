import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../model/note.dart';

class CreateNoteController extends GetxController {
  final bool? isCreated;
  final Note? note;

  CreateNoteController({this.isCreated, this.note});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  late DateTime currentDate = DateTime.now();
  int currentColor = 0;

  final ImagePicker _picker = ImagePicker();

  File? pickedImage;
  File? localImage;

  Future<void> onPickImage() async {
    try {
      pickedImage = File((await _picker.pickImage(
              source: ImageSource.gallery, imageQuality: 90))!
          .path);
      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;
      final String fileName = basename(pickedImage!.path);
      localImage = await pickedImage!.copy('$path/$fileName');
    } catch (exception) {
      print(exception.toString());
    }
    update();
  }

  void onColorChange(int value) {
    currentColor = value;
    update();
  }

  void onDateChange({DateTime? pickedDatetime}) {
    if (pickedDatetime != null) {
      currentDate = pickedDatetime;
    } else {
      currentDate = DateTime.now();
    }
    dateController.text = DateFormat.yMMMd().format(currentDate).toString();
  }

  void initTextControllers() {
    dateController.text = DateFormat.yMMMd().format(currentDate).toString();
  }

  void detectCurrentTextControllers() {
    titleController.text = note!.title;
    currentColor = note!.color;
  }

  @override
  void onInit() {
    super.onInit();
    pickedImage == null;
    localImage == null;
    if (isCreated == null || isCreated == false) {
      initTextControllers();
    } else {
      detectCurrentTextControllers();
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    noteController.dispose();
    dateController.dispose();
    super.onClose();
  }
}
