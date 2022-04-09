import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Container(
      padding: const EdgeInsets.all(10.0),
      constraints: BoxConstraints(maxWidth: infinityWidth, minHeight: 80.0),
      decoration: BoxDecoration(
        color: note.color == 0
            ? blueClr
            : note.color == 1
                ? pinkClr
                : orangeClr,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: TextUtil(
              text: note.title,
              fontSize: 16.sp,
              color: whiteClr,
              fontWeight: FontWeight.w600,
            ),
          ),
          horizontalSpace2(),
          Container(
            height: 70.0,
            width: 1.0,
            color: whiteClr,
          ),
          horizontalSpace2(),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtil(
                    text: note.content,
                    fontSize: 16.sp,
                    color: whiteClr,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.justify,
                  ),
                  verticalSpace1(),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 22.sp,
                        color: whiteClr,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextUtil(
                          text: note.dateTime,
                          fontSize: 14.sp,
                          color: whiteClr,
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
          horizontalSpace1(),
          note.image != '' ? Expanded(
            child: Container(
              height: 110.w,
              width: 110.w,
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                border: Border.all(
                  color: whiteClr,
                  width: 1.5,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                child: Image.file(
                  File(note.image!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ) : const SizedBox(width: 10.0,),
        ],
      ),
    );
  }
}
