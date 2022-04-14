import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/controller/controllers/notes_controller.dart';
import 'package:taskaia/view/app_components.dart';
import '../../../controller/bindings/create_note_binding.dart';
import '../../create_note_view/create_note_view.dart';
import 'components.dart';

class NotesTabView extends GetView<NotesController> {
  const NotesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.notes.isEmpty) {
        return const EmptyWidgetUtil(image: 'assets/images/notes.svg');
      } else {
        return Material(
          color: context.theme.scaffoldBackgroundColor,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.h),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.notes.length,
            itemBuilder: (_, index) => AnimatedItemUtil(
              indexPosition: index,
              child: BuildNoteWidget(
                note: controller.notes[index],
                onClick: () {
                  showBottomSheetUtil(
                    bottomSheetWidget: BuildBottomSheetUtil(
                      onUpdate: () async {
                        await Get.to(() => CreateNoteView(),
                            binding: CreateNoteBinding(
                                isCreated: true,
                                note: controller.notes[index]))
                            ?.then((value) => Get.back());
                      },
                      onDelete: () async {
                        await controller.deleteNote(
                            id: controller.notes[index].id!).then((value) => Get.back());
                      },
                    ),
                  );
                },
              ),
            ),
            separatorBuilder: (_, index) => verticalSpace2(),
          ),
        );
      }
    });
  }
}
