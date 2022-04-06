import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaia/utils/theme/colors.dart';
import 'package:taskaia/view/app_components.dart';

import 'components.dart';

class NotesTabView extends StatelessWidget {
  const NotesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return EmptyWidgetUtil(image: 'assets/images/notes.svg');
    return ResponsiveListUtil(
      padding: EdgeInsets.only(top: 5.h, right: 10.0, left: 10.0),
      itemCount: 7,
      columnCount: 3,
      child: const BuildNoteWidget(),
    );
  }
}

