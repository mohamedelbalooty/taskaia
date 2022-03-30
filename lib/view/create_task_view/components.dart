import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';

class BuildTaskItemWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final VoidCallback? onTap;
  final int maxLines;
  final double height;
  final bool enabled, isSuffix;

  const BuildTaskItemWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.hint,
    this.icon,
    this.onTap,
    this.maxLines = 1,
    this.height = 12.0,
    this.enabled = true,
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
        TextFieldUtil(
          controller: controller,
          hint: hint,
          icon: icon,
          onTap: onTap,
          height: height,
          maxLines: maxLines,
          enabled: enabled,
          isSuffix: isSuffix,
        ),
      ],
    );
  }
}
