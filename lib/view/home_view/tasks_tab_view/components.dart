import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/helper/size_configuration_helper.dart';
import '../../../utils/theme/colors.dart';
import '../../app_components.dart';

class BuildDatePickerWidget extends StatelessWidget {
  BuildDatePickerWidget({Key? key}) : super(key: key);

  // final DateTime selectedDate;
  // final DatePickerController controller;
  // final Function(DateTime?) onDateChange;
  // const BuildDatePickerWidget(
  //     {Key? key, required this.selectedDate, required this.controller, required this.onDateChange,})
  //     : super(key: key);

  final DatePickerController _datePickerController = DatePickerController();
  final _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      _selectedDate,
      controller: _datePickerController,
      height: 120.0,
      width: 75.0,
      initialSelectedDate: _selectedDate,
      selectedTextColor: whiteClr,
      deactivatedColor: context.theme.appBarTheme.backgroundColor!,
      selectionColor: context.theme.appBarTheme.backgroundColor!,
      monthTextStyle: Get.deviceLocale!.languageCode == 'en'
          ? GoogleFonts.lato(
              textStyle: TextStyle(
                color: greyClr,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          : GoogleFonts.cairo(
              textStyle: TextStyle(
                color: greyClr,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
      dayTextStyle: Get.deviceLocale!.languageCode == 'en'
          ? GoogleFonts.lato(
              textStyle: TextStyle(
                color: greyClr,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          : GoogleFonts.cairo(
              textStyle: TextStyle(
                color: greyClr,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
      dateTextStyle: Get.deviceLocale!.languageCode == 'en'
          ? GoogleFonts.lato(
              textStyle: TextStyle(
                color: greyClr,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          : GoogleFonts.cairo(
              textStyle: TextStyle(
                color: greyClr,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
      onDateChange: (DateTime value) {},
    );
  }
}

class BuildTaskWidget extends StatelessWidget {
  final VoidCallback onClick;

  const BuildTaskWidget({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        constraints: BoxConstraints(maxWidth: infinityWidth, minHeight: 80.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: orangeClr,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtil(
                      text: 'Task 1 here',
                      fontSize: 18.sp,
                      color: whiteClr,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2.0),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 22.sp,
                          color: whiteClr,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextUtil(
                            text: DateTime.now().toString(),
                            fontSize: 14.sp,
                            color: whiteClr,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace1(),
                    TextUtil(
                      text:
                          'MediaQuery. I am a noob, so would really like to understand. Otherwise,',
                      fontSize: 16.sp,
                      color: whiteClr,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace2(),
            Container(
              height: 70.0,
              width: 1.0,
              color: whiteClr,
            ),
            horizontalSpace2(),
            RotatedBox(
              quarterTurns: 3,
              child: TextUtil(
                text: 'Todo',
                fontSize: 16.sp,
                color: whiteClr,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildTaskBottomSheetWidget extends StatelessWidget {
  final int isCompleted;

  const BuildTaskBottomSheetWidget({Key? key, required this.isCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          (SizeConfigurationHelper.screenOrientation == Orientation.portrait)
              ? (isCompleted == 0)
                  ? SizeConfigurationHelper.screenHeight * 0.23
                  : SizeConfigurationHelper.screenHeight * 0.32
              : (isCompleted == 0)
                  ? SizeConfigurationHelper.screenHeight * 0.41
                  : SizeConfigurationHelper.screenHeight * 0.6,
      width: infinityWidth,
      margin: symmetricHorizontalPadding2(),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfigurationHelper.screenWidth * 0.25),
              child: const Divider(color: greyClr, thickness: 5.0),
            ),
            const SizedBox(height: 5.0),
            isCompleted == 1
                ? ElevatedButtonUtil(
                    size: Size(infinityWidth, 50.0),
                    radius: 8.0,
                    color: context.theme.appBarTheme.backgroundColor!,
                    child: TextUtil(
                      text: 'Complete Task',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: whiteClr,
                    ),
                    onClick: () {
                      Get.back();
                    },
                  )
                : const SizedBox(),
            SizedBox(height: isCompleted == 1 ? 5.0 : 0.0),
            ElevatedButtonUtil(
              size: Size(infinityWidth, 50.0),
              radius: 8.0,
              color: context.theme.appBarTheme.backgroundColor!,
              child: TextUtil(
                text: 'Delete Task',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: whiteClr,
              ),
              onClick: () {
                Get.back();
              },
            ),
            const DividerUtil(color: greyClr, thickness: 2.0),
            ElevatedButtonUtil(
                size: Size(infinityWidth, 50.0),
                radius: 8.0,
                color: context.theme.appBarTheme.backgroundColor!,
                child: TextUtil(
                  text: 'Cancel',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: whiteClr,
                ),
                onClick: () => Get.back())
          ],
        ),
      ),
    );
  }
}

void showTaskBottomSheet({required int isCompleted}) {
  Get.bottomSheet(
    BuildTaskBottomSheetWidget(isCompleted: isCompleted),
  );
}
