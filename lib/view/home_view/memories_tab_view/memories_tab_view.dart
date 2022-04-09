import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/model/memory.dart';
import 'package:taskaia/utils/helper/size_configuration_helper.dart';
import 'package:taskaia/utils/theme/colors.dart';
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
        }
        // else{
        //   return Stepper(
        //     lineColor: Theme.of(context).appBarTheme.backgroundColor!,
        //     margin: EdgeInsetsDirectional.only(
        //         start: 60.0,
        //         end: (SizeConfigurationHelper.screenOrientation ==
        //                 Orientation.portrait)
        //             ? (SizeConfigurationHelper.screenWidth * 0.15)
        //             : (SizeConfigurationHelper.screenWidth * 0.2)),
        //     currentStep: controller.stepIndex.value,
        //     onStepTapped: (int index) => controller.onSelectStep(index),
        //     controlsBuilder: (BuildContext context, ControlsDetails details) {
        //       return Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           (controller.stepIndex.value < controller.memories.length - 1)
        //               ? ElevatedButtonUtil(
        //                   child: TextUtil(
        //                       text: 'Next',
        //                       fontSize: 16.sp,
        //                       fontWeight: FontWeight.normal,
        //                       color: whiteClr),
        //                   radius: 8.0,
        //                   color: Theme.of(context).appBarTheme.backgroundColor!,
        //                   onClick: () => controller.onNextStep(),
        //                   size: Size(50, 30.h),
        //                 )
        //               : const SizedBox(),
        //           (controller.stepIndex.value == 0)
        //               ? const SizedBox()
        //               : ElevatedButtonUtil(
        //                   child: TextUtil(
        //                       text: 'Previous',
        //                       fontSize: 16.sp,
        //                       fontWeight: FontWeight.normal,
        //                       color: whiteClr),
        //                   radius: 8.0,
        //                   color: Theme.of(context).appBarTheme.backgroundColor!,
        //                   onClick: () => controller.onPreviousStep(),
        //                   size: Size(50, 30.h),
        //                 ),
        //         ],
        //       );
        //     },
        //     steps: List.generate(
        //       controller.memories.length,
        //       (index) => buildStepWidget(
        //         memory: controller.memories[index],
        //       ),
        //     ),
        //
        //   );
        // }

        else {
          return ListView.builder(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.h),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.memories.length,
            itemBuilder: (_, index) {
              return ResponsiveListUtil(
                indexPosition: index,
                child: BuildStepWidget(
                  memory: controller.memories[index],
                  onClick: (){},
                ),
              );
            },
          );
        }
      }),
    );
  }
}
