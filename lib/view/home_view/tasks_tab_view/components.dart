import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/theme/colors.dart';

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
      height: 90.h,
      width: 60.w,
      initialSelectedDate: _selectedDate,
      selectedTextColor: whiteClr,
      deactivatedColor: Get.isDarkMode
          ? const Color(0x30000000)
          : lightHeaderClr,
      selectionColor: Get.isDarkMode
          ? const Color(0x30000000)
          : lightHeaderClr,
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
