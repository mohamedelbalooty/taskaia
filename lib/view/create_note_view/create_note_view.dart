import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controllers/notes_controller.dart';
import '../app_components.dart';
import '../create_task_view/components.dart';

class CreateNoteView extends GetView<NotesController> {
  CreateNoteView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: appBarUtil(
        title: 'Create note',
        autoLeading: true,
        isCenter: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: symmetricHorizontalPadding2(),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                verticalSpace1(),
                BuildTaskItemWidget(
                  title: 'Title',
                  controller: controller.titleController,
                  hint: 'Enter note title here',
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter note title';
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                BuildTaskItemWidget(
                  title: 'Note',
                  controller: controller.noteController,
                  hint: 'Enter note here',
                  maxLines: 3,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter note ';
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BuildColorPickerUtil(
        buttonTitle: 'Create',
        onPickColor: () {},
        onClick: () {
          if (_globalKey.currentState!.validate()) {
            print('No data');
          }
        },
      ),
    );
  }
}
