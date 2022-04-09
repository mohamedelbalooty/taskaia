import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../model/memory.dart';
import '../../../utils/theme/colors.dart';
import '../../app_components.dart';

Step buildStepWidget({required Memory memory}) {
  return Step(
    title: TextUtil(
      text: memory.title.capitalize!,
      fontSize: 18.sp,
      color: Get.isDarkMode ? whiteClr : blackClr,
      fontWeight: FontWeight.bold,
    ),
    subtitle: TextUtil(
      text: memory.dateTime,
      fontSize: 14.sp,
      color: Get.isDarkMode ? whiteClr : blackClr,
      fontWeight: FontWeight.w500,
    ),
    content: AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 1300),
      child: SlideAnimation(
        horizontalOffset: 300,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: pinkClr,
          ),
          child: TextUtil(
            text: memory.content,
            fontSize: 16.sp,
            color: whiteClr,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    ),
    isActive: true,
    state: StepState.indexed,
  );
}

class BuildStepWidget extends StatelessWidget {
  final Memory memory;
  final VoidCallback onClick;

  const BuildStepWidget({Key? key, required this.memory, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: infinityWidth,
      constraints: BoxConstraints(
        minHeight: 150.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 55.h),
            child: SizedBox(
              width: 55,
              child: Expanded(
                child: TextUtil(
                  text: memory.dateTime.split(',')[0],
                  fontSize: 18.0,
                  color: Get.isDarkMode ? whiteClr : blackClr,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          horizontalSpace1(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 2.0,
                color: Get.isDarkMode ? whiteClr : blackClr,
              ),
              Container(
                height: 35.0,
                width: 35.0,
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Get.isDarkMode ? whiteClr : blackClr,
                    width: 2.0,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? whiteClr : blackClr,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                height: 100.h,
                width: 2.0,
                color: Get.isDarkMode ? whiteClr : blackClr,
              ),
            ],
          ),
          horizontalSpace1(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 65.h),
              child: InkWell(
                onTap: onClick,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                child: Container(
                  height: 110.h,
                  width: infinityWidth,
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(12.0),
                      bottomStart: Radius.circular(12.0),
                      bottomEnd: Radius.circular(12.0),
                    ),
                    border: Border.all(
                      color: Get.isDarkMode ? whiteClr : blackClr,
                      width: 1.5,
                    ),
                  ),
                  child: Container(
                    padding: padding2(),
                    decoration: BoxDecoration(
                      color: memory.color == 0
                          ? blueClr
                          : memory.color == 1
                              ? pinkClr
                              : orangeClr,
                      borderRadius: const BorderRadiusDirectional.only(
                        topEnd: Radius.circular(12.0),
                        bottomStart: Radius.circular(12.0),
                        bottomEnd: Radius.circular(12.0),
                      ),
                    ),
                    child: TextUtil(
                      text: memory.content,
                      fontSize: 16.sp,
                      color: whiteClr,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
