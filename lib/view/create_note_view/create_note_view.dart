import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_components.dart';
import '../create_task_view/components.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({Key? key}) : super(key: key);

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

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
          child: Column(
            children: [
              verticalSpace1(),
              BuildTaskItemWidget(
                title: 'Title',
                controller: _titleController,
                hint: 'Enter note title here',
              ),
              verticalSpace2(),
              BuildTaskItemWidget(
                title: 'Note',
                controller: _noteController,
                hint: 'Enter note here',
                maxLines: 3,
              ),
              verticalSpace2(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BuildColorPickerUtil(
        buttonTitle: 'Create',
        onPickColor: () {},
        onClick: () {},
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }
}
