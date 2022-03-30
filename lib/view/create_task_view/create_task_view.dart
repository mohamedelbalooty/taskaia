import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: appBarUtil(
        title: 'Create task',
        autoLeading: true,
        isCenter: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: symmetricHorizontalPadding2(),
          child: Column(
            children: [
              verticalSpace1(),
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
              verticalSpace3(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BuildColorPickerUtil(
        buttonTitle: 'Create',
        onPickColor: () {},
        onClick: () {},
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _taskController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _reminderController.dispose();
    _repeatController.dispose();
    super.dispose();
  }
}
