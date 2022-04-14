import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/note.dart';
import '../../../utils/theme/colors.dart';
import '../../app_components.dart';

class BuildNoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onClick;

  const BuildNoteWidget({Key? key, required this.note, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: BorderUtil(
        padding: padding2(),
        constraints: BoxConstraints(maxWidth: infinityWidth, minHeight: 80.h),
        color: note.color == 0
            ? blueClr
            : note.color == 1
                ? pinkClr
                : orangeClr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                constraints:
                    BoxConstraints(maxWidth: infinityWidth, minHeight: 80.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtil(
                      text: note.title,
                      fontSize: 20.sp,
                      color: Get.isDarkMode ? whiteClr : blackClr,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace1(),
                    TextUtil(
                      text: note.content,
                      fontSize: 16.sp,
                      color: Get.isDarkMode ? whiteClr : blackClr,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.justify,
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
                          text: note.dateTime,
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
            horizontalSpace1(),
            note.image != ''
                ? BorderUtil(
                    height: 110.w,
                    width: 110.w,
                    color: transparent,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(11.0)),
                      child: Image.file(
                        File(note.image!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 10.0,
                  ),
          ],
        ),
      ),
    );
  }
}
