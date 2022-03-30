import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/controller/controllers/theme_controller.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';
import 'components.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({Key? key}) : super(key: key);

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _reminderController = TextEditingController();
  final TextEditingController _repeatController = TextEditingController();
  // final TextEditingController _taskController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar:
          appBarUtil(title: 'Create task', autoLeading: true, isCenter: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: symmetricHorizontalPadding2(),
          child: Column(
            children: [
              BuildTaskItemWidget(
                title: 'Title',
                controller: _titleController,
                hint: 'Enter task title here',
              ),
              verticalSpace2(),
              BuildTaskItemWidget(
                title: 'Task',
                controller: _taskController,
                hint: 'Enter task here',
                maxLines: 3,
              ),
              verticalSpace2(),
              BuildTaskItemWidget(
                title: 'Date',
                controller: _dateController,
                hint: 'Enter task here',
                icon: Icons.date_range,
                enabled: false,
                isSuffix: true,
              ),
              verticalSpace2(),
              Row(
                children: [
                  Expanded(
                    child: BuildTaskItemWidget(
                      title: 'Start time',
                      controller: _startTimeController,
                      hint: 'Enter task here',
                      icon: Icons.access_time,
                      enabled: false,
                      isSuffix: true,
                    ),
                  ),
                  horizontalSpace2(),
                  Expanded(
                    child: BuildTaskItemWidget(
                      title: 'End time',
                      controller: _endTimeController,
                      hint: 'Enter task here',
                      icon: Icons.access_time,
                      enabled: false,
                      isSuffix: true,
                    ),
                  ),
                ],
              ),
              verticalSpace2(),
              BuildTaskItemWidget(
                title: 'Reminder',
                controller: _taskController,
                hint: 'Enter task here',
                icon: Icons.keyboard_arrow_down_rounded,
                enabled: false,
                isSuffix: true,
              ),
              verticalSpace2(),
              BuildTaskItemWidget(
                title: 'Repeat',
                controller: _taskController,
                hint: 'Enter task here',
                icon: Icons.keyboard_arrow_down_rounded,
                enabled: false,
                isSuffix: true,
              ),
              verticalSpace2(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtil(
                          text: 'Color',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode ? whiteClr : blackClr,
                        ),
                        verticalSpace1(),
                        SizedBox(
                          height: 25.w,
                          width: infinityWidth,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index){
                              List<Color> _colors = [
                                blueClr,
                                pinkClr,
                                orangeClr
                              ];
                              return Container(
                                height: 25.w,
                                width: 25.w,
                                decoration: BoxDecoration(
                                  color: _colors[index],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: context.theme.scaffoldBackgroundColor,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) => const SizedBox(width: 10.0,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace2(),
                  ElevatedButtonUtil(
                    child:  TextUtil(
                      text: 'Create',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: context.theme.scaffoldBackgroundColor,
                    ),
                    radius: 10.0,
                    onClick: (){},
                  ),
                ],
              ),
              verticalSpace4(),
            ],
          ),
        ),
      ),
    );
  }
}
