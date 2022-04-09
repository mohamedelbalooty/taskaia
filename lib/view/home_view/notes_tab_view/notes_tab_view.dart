import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/controller/controllers/notes_controller.dart';
import 'package:taskaia/view/app_components.dart';
import 'components.dart';

class NotesTabView extends GetView<NotesController> {
  const NotesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.notes.isEmpty) {
        return const EmptyWidgetUtil(image: 'assets/images/notes.svg');
      } else {
        return ListView.separated(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.h),
          physics: const BouncingScrollPhysics(),
          itemCount: controller.notes.length,
          itemBuilder: (_, index) {
            return ResponsiveListUtil(
              indexPosition: index,
              child: BuildNoteWidget(
                note: controller.notes[index],
                onClick: (){
                  print(index);
                },
              ),
            );
          },
          separatorBuilder: (_, index) => verticalSpace2(),
        );
      }
    });
  }
}
