import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/task.dart';
import '../../../utils/theme/colors.dart';
import '../../app_components.dart';

class BuildTaskWidget extends StatelessWidget {
  final Task task;
  final VoidCallback onClick;

  const BuildTaskWidget({Key? key, required this.task, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: BorderUtil(
        constraints: BoxConstraints(maxWidth: infinityWidth, minHeight: 80.h),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        color: task.color == 0
            ? blueClr
            : task.color == 1
                ? pinkClr
                : orangeClr,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtil(
                      text: task.title.capitalize!,
                      fontSize: 20.sp,
                      color: Get.isDarkMode ? whiteClr : blackClr,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace2(),
                    TextUtil(
                      text: task.content,
                      fontSize: 16.sp,
                      color: Get.isDarkMode ? whiteClr : blackClr,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.justify,
                    ),
                    verticalSpace1(),
                    Row(
                      children: [
                        Icon(
                          Icons.repeat,
                          size: 22.sp,
                          color: Get.isDarkMode ? whiteClr : blackClr,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextUtil(
                            text: task.repeat,
                            fontSize: 14.sp,
                            color: Get.isDarkMode ? whiteClr : blackClr,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace1(),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 22.sp,
                          color: Get.isDarkMode ? whiteClr : blackClr,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextUtil(
                            text: task.remind.toString(),
                            fontSize: 14.sp,
                            color: Get.isDarkMode ? whiteClr : blackClr,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace1(),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 22.sp,
                          color: Get.isDarkMode ? whiteClr : blackClr,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextUtil(
                            text: task.dateTime,
                            fontSize: 14.sp,
                            color: Get.isDarkMode ? whiteClr : blackClr,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace1(),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 22.sp,
                          color: Get.isDarkMode ? whiteClr : blackClr,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextUtil(
                            text: '${task.startTime} to ${task.endTime}',
                            fontSize: 14.sp,
                            color: Get.isDarkMode ? whiteClr : blackClr,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace2(),
            Container(
              height: 70.0,
              width: 1.0,
              color: Get.isDarkMode ? whiteClr : blackClr,
            ),
            horizontalSpace2(),
            RotatedBox(
              quarterTurns: 3,
              child: TextUtil(
                text:
                    task.isCompleted == 0 ? 'un_completed'.tr : 'completed'.tr,
                fontSize: 16.sp,
                color: Get.isDarkMode ? whiteClr : blackClr,
                fontWeight: FontWeight.bold,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
