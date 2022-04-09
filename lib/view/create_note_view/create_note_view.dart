import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/controller/controllers/create_note_controller.dart';
import '../../controller/controllers/notes_controller.dart';
import '../../model/note.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';
import '../create_task_view/components.dart';
import 'components.dart';

class CreateNoteView extends GetView<CreateNoteController> {
  CreateNoteView({Key? key}) : super(key: key);
  final NotesController _controller = Get.find<NotesController>();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                BuildTaskItemWidget(
                  title: 'Date',
                  controller: controller.dateController,
                  hint: 'Enter task here',
                  icon: IconButtonUtil(
                    icon: Icons.date_range,
                    color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                    iconSize: 24.sp,
                    onClick: () {
                      showDatetimePicker(context,
                          initialDate: controller.currentDate)
                          .then((value) =>
                          controller.onDateChange(pickedDatetime: value));
                    },
                  ),
                  readOnly: true,
                  isSuffix: true,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter date';
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                const PickImageWidget(),
                verticalSpace2(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BuildColorPickerUtil(
        buttonTitle: controller.isCreated == true ? 'Update' : 'Create',
        child: GetBuilder<CreateNoteController>(builder: (context) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: colorsPalettes.length,
            itemBuilder: (_, index) {
              return ColorPaletteUtil(
                selectedColor: colorsPalettes[index],
                isSelected: controller.currentColor == index,
                onPickedColor: () {
                  controller.onColorChange(index);
                },
              );
            },
            separatorBuilder: (_, index) => const SizedBox(width: 5.0),
          );
        }),
        onClick: () {
          if (_globalKey.currentState!.validate()) {
            controller.isCreated == true
                ? _controller
                    .updateNote(
                        note: Note(
                            id: controller.note!.id,
                            title: controller.note!.title,
                            content: controller.note!.content,
                            dateTime: controller.note!.dateTime,
                            color: controller.note!.color,
                            image: controller.note!.image ?? ''))
                    .then((value) => Get.back())
                : _controller
                    .insertNotes(
                        note: Note(
                      title: controller.titleController.text,
                      content: controller.noteController.text,
                      dateTime: controller.dateController.text,
                      color: controller.currentColor,
                      image: controller.localImage?.path.toString() ?? '',
                    ))
                    .then((value) => Get.back());
          }
        },
      ),
    );
  }
}
