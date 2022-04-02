import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  final DateTime _currentDate = DateTime.now();
  final String _startTime = DateFormat.jm().format(DateTime.now()).toString();
  final String _endTime = DateFormat.jm()
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  final List<int> _reminderList = [5, 10, 15, 20];
  final List<String> _repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  String _currentRepeat = 'None';
  int _currentReminder = 5;



  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat.yMMMd().format(_currentDate).toString();
    _startTimeController.text = _startTime;
    _endTimeController.text = _endTime;
    _repeatController.text = _currentRepeat;
    _reminderController.text = _currentReminder.toString();
  }
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
                icon: Icon(
                  Icons.date_range,
                  color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                  size: 24.sp,
                ),
                readOnly: true,
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
                      icon: Icon(
                        Icons.access_time,
                        color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                        size: 24.sp,
                      ),
                      readOnly: true,
                      isSuffix: true,
                    ),
                  ),
                  horizontalSpace2(),
                  Expanded(
                    child: BuildTaskItemWidget(
                      title: 'End time',
                      controller: _endTimeController,
                      hint: 'Enter task here',
                      icon: Icon(
                        Icons.access_time,
                        color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                        size: 24.sp,
                      ),
                      readOnly: true,
                      isSuffix: true,
                    ),
                  ),
                ],
              ),
              verticalSpace2(),
              BuildTaskItemWidget(
                title: 'Reminder',
                controller: _reminderController,
                hint: 'Enter task here',
                icon: BuildPopUpMenuButtonUtil(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                    size: 24.sp,
                  ),
                  entries: _reminderList.map((e) => e.toString()).toList(),
                  onSelected: (String? value){
                    setState(() {
                      _currentReminder = int.parse(value!);
                      _reminderController.text = _currentReminder.toString();
                    });
                  },
                ),
                readOnly: true,
                isSuffix: true,
              ),
              verticalSpace2(),
              BuildTaskItemWidget(
                title: 'Repeat',
                controller: _repeatController,
                hint: 'Enter task here',
                icon: BuildPopUpMenuButtonUtil(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                    size: 24.sp,
                  ),
                  entries: _repeatList,
                  onSelected: (String? value){
                    setState(() {
                      _currentRepeat = value!;
                      _repeatController.text = _currentRepeat;
                    });
                  },
                ),
                readOnly: true,
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
        onClick: () {
        },
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
