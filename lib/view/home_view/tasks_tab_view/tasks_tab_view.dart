import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskaia/controller/controllers/language_controller.dart';
import 'package:taskaia/controller/controllers/tasks_controller.dart';
import 'package:taskaia/utils/theme/colors.dart';
import '../../../controller/bindings/create_task_binding.dart';
import '../../app_components.dart';
import '../../create_task_view/create_task_view.dart';
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
                    text: DateFormat.yMMMEd(
                            LanguageController().localLang == 'ar'
                                ? 'ar_SA'
                                : 'en_US')
                        .format(DateTime.now())
                        .toString(),
                    color: Get.isDarkMode ? whiteClr : blackClr,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  TextUtil(
                    text: 'today'.tr,
                    color: Get.isDarkMode ? whiteClr : blackClr,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  verticalSpace2(),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.tasks.length,
                    itemBuilder: (_, index) => AnimatedItemUtil(
                      child: BuildTaskWidget(
                          task: controller.tasks[index],
                          onClick: () {
                            showBottomSheetUtil(
                              bottomSheetWidget: BuildBottomSheetUtil(
                                updateTitle:
                                    controller.tasks[index].isCompleted == 0
                                        ? 'completed_task'.tr
                                        : 'update'.tr,
                                onUpdate: () async {
                                  controller.tasks[index].isCompleted == 0
                                      ? controller
                                          .updateRowTask(
                                              id: controller.tasks[index].id!)
                                          .then((value) => Get.back())
                                      : await Get.to(
                                          () => CreateTaskView(),
                                          binding: CreateTaskBinding(
                                              isCreated: true,
                                              task: controller.tasks[index]),
                                        )?.then((value) => Get.back());
                                },
                                onDelete: () async {
                                  await controller
                                      .deleteTask(
                                          id: controller.tasks[index].id!)
                                      .then((value) => Get.back());
                                },
                              ),
                            );
                          }),
                      indexPosition: index,
                    ),
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
