import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';

class BuildTaskItemWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final Widget? icon;
  final String? Function(String?) validate;
  final VoidCallback? onTap;
  final int maxLines;
  final bool readOnly, isSuffix;

  const BuildTaskItemWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.hint,
    required this.validate,
    this.onTap,
    this.icon,
    this.maxLines = 1,
    this.readOnly = false,
    this.isSuffix = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtil(
          text: title,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? whiteClr : blackClr,
        ),
        verticalSpace1(),
        TextFormFieldUtil(
          controller: controller,
          validate: validate,
          onTap: onTap,
          hint: hint,
          icon: icon,
          maxLines: maxLines,
          readOnly: readOnly,
          isSuffix: isSuffix,
        ),
      ],
    );
  }
}
