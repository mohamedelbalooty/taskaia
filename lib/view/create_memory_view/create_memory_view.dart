import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/model/memory.dart';
import '../../controller/controllers/create_memory_controller.dart';
import '../../controller/controllers/memories_controller.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';

class CreateMemoryView extends GetView<CreateMemoryController> {
  CreateMemoryView({Key? key}) : super(key: key);

  final MemoriesController _controller = Get.find<MemoriesController>();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: appBarUtil(
        title: 'create_memory'.tr,
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
                  controller: controller.memoryController,
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BuildColorPickerUtil(
        buttonTitle: controller.isCreated == true ? 'update'.tr : 'create'.tr,
        child: GetBuilder<CreateMemoryController>(builder: (context) {
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
                    .updateMemory(
                      memory: Memory(
                          id: controller.memory!.id,
                          title: controller.titleController.text,
                          content: controller.memoryController.text,
                          dateTime: controller.dateController.text,
                          color: controller.currentColor),
                    )
                    .then((value) => Get.back())
                : _controller
                    .insertMemory(
                      memory: Memory(
                          title: controller.titleController.text,
                          content: controller.memoryController.text,
                          dateTime: controller.dateController.text,
                          color: controller.currentColor),
                    )
                    .then((value) => Get.back());
          }
        },
      ),
    );
  }
}
