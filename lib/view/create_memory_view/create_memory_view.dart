import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/controllers/memories_controller.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';
import '../create_task_view/components.dart';

class CreateMemoryView extends GetView<MemoriesController> {
  CreateMemoryView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: appBarUtil(
        title: 'Create memory',
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
                  hint: 'Enter memory title here',
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter memory title';
                    }
                    return null;
                  },
                ),
                verticalSpace2(),
                BuildTaskItemWidget(
                  title: 'Note',
                  controller: controller.memoryController,
                  hint: 'Enter memory here',
                  maxLines: 3,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter memory here';
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
                  readOnly: false,
                  isSuffix: true,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter task here';
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
