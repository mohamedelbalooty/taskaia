import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/controllers/create_task_controller.dart';
import '../../controller/controllers/tasks_controller.dart';
import '../../model/task.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';

class CreateTaskView extends GetView<CreateTaskController> {
  CreateTaskView({Key? key}) : super(key: key);
  final TasksController _controller = Get.find<TasksController>();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: appBarUtil(
        title: 'create_task'.tr,
        autoLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: symmetricHorizontalPadding2(),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                verticalSpace1(),
                BuildTextInputItemWidget(
                  title: 'title'.tr,
                  controller: controller.titleController,
                  hint: 'title_hint'.tr,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'title_verify'.tr;
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                BuildTextInputItemWidget(
                  title: 'description'.tr,
                  controller: controller.taskController,
                  hint: 'description_hint'.tr,
                  maxLines: 3,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'description_verify'.tr;
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                BuildTextInputItemWidget(
                  title: 'datetime'.tr,
                  controller: controller.dateController,
                  hint: 'datetime_hint'.tr,
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
                      return 'datetime_verify'.tr;
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                Row(
                  children: [
                    Expanded(
                      child: BuildTextInputItemWidget(
                        title: 'start_time'.tr,
                        controller: controller.startTimeController,
                        hint: 'start_time_hint'.tr,
                        icon: IconButtonUtil(
                          icon: Icons.access_time,
                          color:
                              Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                          iconSize: 24.sp,
                          onClick: () {
                            showTimingPicker(context, isStartTime: true).then(
                                (value) => controller.onStartTimeChange(context,
                                    pickedTime: value));
                          },
                        ),
                        readOnly: true,
                        isSuffix: true,
                        validate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'start_time_verify'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    horizontalSpace2(),
                    Expanded(
                      child: BuildTextInputItemWidget(
                        title: 'end_time'.tr,
                        controller: controller.endTimeController,
                        hint: 'end_time_hint'.tr,
                        icon: IconButtonUtil(
                          icon: Icons.access_time,
                          color:
                              Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                          iconSize: 24.sp,
                          onClick: () {
                            showTimingPicker(context, isStartTime: false).then(
                                (value) => controller.onEnfTimeChange(context,
                                    pickedTime: value));
                          },
                        ),
                        readOnly: true,
                        isSuffix: true,
                        validate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'end_time_verify'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                verticalSpace2(),
                BuildTextInputItemWidget(
                  title: 'reminder'.tr,
                  controller: controller.reminderController,
                  hint: 'reminder_hint'.tr,
                  icon: BuildPopUpMenuButtonUtil(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                      size: 24.sp,
                    ),
                    entries: controller.reminderList
                        .map((e) => e.toString())
                        .toList(),
                    onSelected: (String? value) {
                      controller.onReminderChange(value!);
                    },
                  ),
                  readOnly: true,
                  isSuffix: true,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'reminder_verify'.tr;
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                BuildTextInputItemWidget(
                  title: 'repeat'.tr,
                  controller: controller.repeatController,
                  hint: 'repeat_hint'.tr,
                  icon: BuildPopUpMenuButtonUtil(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                      size: 24.sp,
                    ),
                    entries: controller.repeatList,
                    onSelected: (String? value) {
                      controller.onRepeatChange(value!);
                    },
                  ),
                  readOnly: true,
                  isSuffix: true,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'repeat_verify'.tr;
                    }
                    return null;
                  },
                ),
                verticalSpace3(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BuildColorPickerUtil(
        buttonTitle: controller.isCreated == true ? 'update'.tr : 'create'.tr,
        child: GetBuilder<CreateTaskController>(builder: (context) {
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
                    .updateTask(
                      task: Task(
                          id: controller.task!.id,
                          content: controller.taskController.text,
                          title: controller.titleController.text,
                          dateTime: controller.dateController.text,
                          startTime: controller.startTimeController.text,
                          endTime: controller.endTimeController.text,
                          repeat: controller.repeatController.text,
                          remind: int.parse(controller.reminderController.text),
                          isCompleted: 1,
                          color: controller.currentColor),
                    )
                    .then((value) => Get.back())
                : _controller
                    .insertTask(
                      task: Task(
                          content: controller.taskController.text,
                          title: controller.titleController.text,
                          dateTime: controller.dateController.text,
                          startTime: controller.startTimeController.text,
                          endTime: controller.endTimeController.text,
                          repeat: controller.repeatController.text,
                          remind: int.parse(controller.reminderController.text),
                          isCompleted: 0,
                          color: controller.currentColor),
                    )
                    .then((value) => Get.back());
          }
        },
      ),
    );
  }
}
