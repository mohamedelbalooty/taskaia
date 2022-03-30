import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaia/view/app_components.dart';

class NotesTabView extends StatelessWidget {
  const NotesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgImageUtil(
        image: 'assets/images/notes.svg',
        height: 200.h,
        width: 200.w,
      ),
    );
  }
}
