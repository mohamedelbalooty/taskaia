import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/controller/bindings/create_memory_binding.dart';
import 'package:taskaia/view/create_memory_view/create_memory_view.dart';
import '../../../controller/controllers/memories_controller.dart';
import '../../app_components.dart';
import 'components.dart';

class MemoriesTabView extends GetView<MemoriesController> {
  const MemoriesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Obx(() {
        if (controller.memories.isEmpty) {
          return const EmptyWidgetUtil(image: 'assets/images/memories.svg');
        } else {
          return ListView.builder(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.h),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.memories.length,
            itemBuilder: (_, index) => AnimatedItemUtil(
              indexPosition: index,
              child: BuildStepWidget(
                memory: controller.memories[index],
                index: index + 1,
                onClick: () {
                  showBottomSheetUtil(
                    bottomSheetWidget: BuildBottomSheetUtil(
                      onUpdate: () async {
                        await Get.to(() => CreateMemoryView(),
                            binding: CreateMemoryBinding(
                                isCreated: true,
                                memory: controller.memories[index]))
                            ?.then((value) => Get.back());
                      },
                      onDelete: () async {
                        await controller
                            .deleteMemory(id: controller.memories[index].id!)
                            .then((value) => Get.back());
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }
      }),
    );
  }
}
