import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_components.dart';

class TasksTabView extends StatelessWidget {
  const TasksTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgImageUtil(
        image: 'assets/images/tasks.svg',
        height: 200.h,
        width: 200.w,
      ),
    );
  }
}