import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/utils/helper/size_configuration_helper.dart';
import 'package:taskaia/utils/theme/colors.dart';
import '../../../controller/controllers/memories_controller.dart';
import '../../app_components.dart';
import 'components.dart';

class MemoriesTabView extends StatefulWidget {
  const MemoriesTabView({Key? key}) : super(key: key);

  @override
  State<MemoriesTabView> createState() => _MemoriesTabViewState();
}

class _MemoriesTabViewState extends State<MemoriesTabView> {
  final MemoriesController _memoriesController = Get.find<MemoriesController>();

  @override
  Widget build(BuildContext context) {
    if (_memoriesController.memories.isEmpty) {
      return const EmptyWidgetUtil(image: 'assets/images/memories.svg');
    }
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Obx(() {
        return Stepper(
          lineColor: Theme.of(context).appBarTheme.backgroundColor!,
          margin: EdgeInsetsDirectional.only(
              start: 60.0,
              end: (SizeConfigurationHelper.screenOrientation ==
                      Orientation.portrait)
                  ? (SizeConfigurationHelper.screenWidth * 0.15)
                  : (SizeConfigurationHelper.screenWidth * 0.2)),
          currentStep: _memoriesController.stepIndex.value,
          onStepTapped: (int index) => _memoriesController.onSelectStep(index),
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (_memoriesController.stepIndex.value <
                        _memoriesController.memories.length - 1)
                    ? ElevatedButtonUtil(
                        child: TextUtil(
                            text: 'Next',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: whiteClr),
                        radius: 8.0,
                        color: Theme.of(context).appBarTheme.backgroundColor!,
                        onClick: () => _memoriesController.onNextStep(),
                        size: const Size(50, 30),
                      )
                    : const SizedBox(),
                (_memoriesController.stepIndex.value == 0)
                    ? const SizedBox()
                    : ElevatedButtonUtil(
                        child: TextUtil(
                            text: 'Previous',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: whiteClr),
                        radius: 8.0,
                        color: Theme.of(context).appBarTheme.backgroundColor!,
                        onClick: () => _memoriesController.onPreviousStep(),
                        size: const Size(50, 30),
                      ),
              ],
            );
          },
          steps: List.generate(
            _memoriesController.memories.length,
            (index) => buildStepWidget(
              memory: _memoriesController.memories[index],
            ),
          ),
        );
      }),
    );
  }
}
