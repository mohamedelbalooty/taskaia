import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/memory.dart';
import '../../../utils/theme/colors.dart';
import '../../app_components.dart';

class BuildStepWidget extends StatelessWidget {
  final Memory memory;
  final int index;
  final VoidCallback onClick;

  const BuildStepWidget(
      {Key? key,
      required this.memory,
      required this.index,
      required this.onClick})
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
            padding: EdgeInsets.only(top: 40.h),
            child: SizedBox(
              width: 25.0,
              child: TextUtil(
                text: index.toString(),
                fontSize: 18.0,
                color: Get.isDarkMode ? whiteClr : blackClr,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 2.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40.h,
                width: 2.w,
                color: Get.isDarkMode ? whiteClr : blackClr,
              ),
              Container(
                height: 35.0,
                width: 35.0,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Get.isDarkMode ? whiteClr : blackClr,
                    width: 2.w,
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
                height: 130.h,
                width: 2.0,
                color: Get.isDarkMode ? whiteClr : blackClr,
              ),
            ],
          ),
          horizontalSpace1(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: GestureDetector(
                onTap: onClick,
                child: BorderUtil(
                  width: infinityWidth,
                  constraints: BoxConstraints(
                    minHeight: 100.h,
                    maxHeight: 130.h,
                  ),
                  padding: padding2(),
                  color: memory.color == 0
                      ? blueClr
                      : memory.color == 1
                          ? pinkClr
                          : orangeClr,
                  isAllBorder: false,
                  topLeft: 0.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtil(
                        text: memory.title,
                        fontSize: 20.sp,
                        color: Get.isDarkMode ? whiteClr : blackClr,
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace1(),
                      Expanded(
                        child: TextUtil(
                          text: memory.content,
                          fontSize: 16.sp,
                          color: Get.isDarkMode ? whiteClr : blackClr,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.justify,
                          textOverflow: TextOverflow.fade,
                          height: 1.3,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            size: 22.sp,
                            color: Get.isDarkMode ? whiteClr : blackClr,
                          ),
                          const SizedBox(width: 10.0),
                          TextUtil(
                            text: memory.dateTime,
                            fontSize: 14.sp,
                            color: Get.isDarkMode ? whiteClr : blackClr,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
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
