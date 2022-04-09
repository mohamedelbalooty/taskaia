import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskaia/controller/controllers/tasks_controller.dart';
import 'package:taskaia/utils/theme/colors.dart';
import '../../app_components.dart';
import 'components.dart';

class TasksTabView extends GetView<TasksController> {
  const TasksTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.tasks.isEmpty) {
        return const EmptyWidgetUtil(image: 'assets/images/tasks.svg');
      } else {
        return Material(
          color: context.theme.scaffoldBackgroundColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: symmetricHorizontalPadding1(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace1(),
                  TextUtil(
                    text: DateFormat.yMMMEd().format(DateTime.now()).toString(),
                    color: Get.isDarkMode ? whiteClr : blackClr,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  TextUtil(
                    text: 'Today',
                    color: Get.isDarkMode ? whiteClr : blackClr,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  verticalSpace1(),
                  BuildDatePickerWidget(),
                  verticalSpace1(),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.tasks.length,
                    itemBuilder: (_, index) {
                      return ResponsiveListUtil(
                        child: BuildTaskWidget(
                            task: controller.tasks[index],
                            onClick: () {
                              showBottomSheetUtil(
                                bottomSheetWidget: BuildTaskBottomSheetWidget(
                                    task: controller.tasks[index]),
                              );
                            }),
                        indexPosition: index,
                      );
                    },
                    separatorBuilder: (_, index) => verticalSpace2(),
                  ),
                  verticalSpace1(),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
