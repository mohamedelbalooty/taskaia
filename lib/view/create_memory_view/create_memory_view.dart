import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';
import '../create_task_view/components.dart';

class CreateMemoryView extends StatefulWidget {
  const CreateMemoryView({Key? key}) : super(key: key);

  @override
  State<CreateMemoryView> createState() => _CreateMemoryViewState();
}

class _CreateMemoryViewState extends State<CreateMemoryView> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _memoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: appBarUtil(
        title: 'Create memory',
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
                hint: 'Enter memory title here',
              ),
              verticalSpace2(),
              BuildTaskItemWidget(
                title: 'Note',
                controller: _memoryController,
                hint: 'Enter memory here',
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
                readOnly: false,
                isSuffix: true,
              ),
              verticalSpace2(),
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
    _memoryController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}

