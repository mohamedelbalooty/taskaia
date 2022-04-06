import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/controllers/tasks_controller.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';
import 'components.dart';

class CreateTaskView extends GetView<TasksController> {
  CreateTaskView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: appBarUtil(
        title: 'Create task',
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
                  hint: 'Enter task title here',
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter task title';
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                BuildTaskItemWidget(
                  title: 'Task',
                  controller: controller.taskController,
                  hint: 'Enter task here',
                  maxLines: 3,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter task';
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                BuildTaskItemWidget(
                  title: 'Date',
                  controller: controller.dateController,
                  hint: 'Enter task here',
                  icon: Icon(
                    Icons.date_range,
                    color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                    size: 24.sp,
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
                Row(
                  children: [
                    Expanded(
                      child: BuildTaskItemWidget(
                        title: 'Start time',
                        controller: controller.startTimeController,
                        hint: 'Enter time',
                        icon: Icon(
                          Icons.access_time,
                          color:
                              Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                          size: 24.sp,
                        ),
                        readOnly: true,
                        isSuffix: true,
                        validate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter time';
                          }
                          return null;
                        },
                      ),
                    ),
                    horizontalSpace2(),
                    Expanded(
                      child: BuildTaskItemWidget(
                        title: 'End time',
                        controller: controller.endTimeController,
                        hint: 'Enter time',
                        icon: Icon(
                          Icons.access_time,
                          color:
                              Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                          size: 24.sp,
                        ),
                        readOnly: true,
                        isSuffix: true,
                        validate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter time';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                verticalSpace2(),
                BuildTaskItemWidget(
                  title: 'Reminder',
                  controller: controller.reminderController,
                  hint: 'Enter reminder here',
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
                      return 'Enter reminder';
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                BuildTaskItemWidget(
                  title: 'Repeat',
                  controller: controller.repeatController,
                  hint: 'Enter repeat here',
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
                      return 'Enter repeat';
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
        buttonTitle: 'Create',
        onPickColor: () {},
        onClick: () {
          if (_globalKey.currentState!.validate()) {}
        },
      ),
    );
  }
}
