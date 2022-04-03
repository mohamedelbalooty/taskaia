import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskaia/utils/theme/colors.dart';
import '../../app_components.dart';
import 'components.dart';

class TasksTabView extends StatelessWidget {
  const TasksTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: symmetricHorizontalPadding2(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace1(),
              TextUtil(
                text: DateFormat.yMMMEd().format(DateTime.now()).toString(),
                color: Get.isDarkMode ? whiteClr : blackClr,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,                height: 1.2,

              ),
              TextUtil(
                text: 'Today',
                color: Get.isDarkMode ? whiteClr : blackClr,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              verticalSpace1(),
              BuildDatePickerWidget(),
              verticalSpace1(),
              ResponsiveListUtil(
                child: BuildTaskWidget(
                    onClick: () => showTaskBottomSheet(isCompleted: 1)),
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              verticalSpace1(),
            ],
          ),
        ),
      ),
    );
  }
}