import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

double infinityHeight = double.infinity;
double infinityWidth = double.infinity;

SizedBox verticalSpace1() => SizedBox(height: 5.h);

SizedBox verticalSpace2() => SizedBox(height: 10.h);

SizedBox verticalSpace3() => SizedBox(height: 15.h);

SizedBox verticalSpace4() => SizedBox(height: 20.h);

SizedBox verticalSpace5() => SizedBox(height: 30.h);

SizedBox horizontalSpace1() => SizedBox(width: 5.w);

SizedBox horizontalSpace2() => SizedBox(width: 10.w);

SizedBox horizontalSpace3() => SizedBox(width: 15.w);

SizedBox horizontalSpace4() => SizedBox(width: 20.w);

SizedBox horizontalSpace5() => SizedBox(width: 30.w);

EdgeInsets padding1() => const EdgeInsets.all(5);

EdgeInsets padding2() => const EdgeInsets.all(10);

EdgeInsets padding3() => const EdgeInsets.all(20);

EdgeInsets symmetricVerticalPadding1() => EdgeInsets.symmetric(vertical: 10.h);

EdgeInsets symmetricVerticalPadding2() => EdgeInsets.symmetric(vertical: 15.h);

EdgeInsets symmetricHorizontalPadding1() =>
    EdgeInsets.symmetric(horizontal: 10.w);

EdgeInsets symmetricHorizontalPadding2() =>
    EdgeInsets.symmetric(horizontal: 15.w);

EdgeInsets symmetricHorizontalPadding3() =>
    EdgeInsets.symmetric(horizontal: 20.w);

///BUTTONS

class IconButtonUtil extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double iconSize;
  final VoidCallback onClick;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;

  const IconButtonUtil(
      {Key? key,
      required this.icon,
      required this.color,
      required this.iconSize,
      required this.onClick,
      this.padding = const EdgeInsets.all(8.0),
      this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      iconSize: iconSize,
      onPressed: onClick,
      padding: padding,
      constraints: constraints,
    );
  }
}

class ElevatedButtonUtil extends StatelessWidget {
  final Widget child;
  final Function() onClick;
  final Color color;
  final Size size;
  final double radius;

  const ElevatedButtonUtil(
      {Key? key,
      required this.child,
      required this.onClick,
      this.color = lightHeaderClr,
      this.size = const Size(150.0, 50.0),
      this.radius = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onClick,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}

class TextUtil extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final Color color;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;

  const TextUtil({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color = whiteClr,
    this.height,
    this.fontFamily,
    this.decoration,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.deviceLocale!.languageCode == 'en'
          ? GoogleFonts.lato(
              textStyle: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                height: height,
                decoration: decoration,
              ),
            )
          : GoogleFonts.cairo(
              textStyle: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                height: height,
                decoration: decoration,
              ),
            ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}

class TextFieldUtil extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final VoidCallback? onTap;
  final int maxLines;
  final double height;
  final bool enabled, isSuffix;

  const TextFieldUtil({
    Key? key,
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
    return TextField(
      controller: controller,
      onTap: onTap,
      style: TextStyle(
        color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      maxLines: maxLines,
      cursorColor: Theme.of(context).appBarTheme.backgroundColor,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 10.0, vertical: height),
        enabled: enabled,
        hintText: hint,
        hintStyle: TextStyle(
          color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: isSuffix
            ? Icon(
                icon,
                color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                size: 24.sp,
              )
            : const SizedBox(),
        border: _border(),
        disabledBorder: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),
        errorBorder: _border(),
        focusedErrorBorder: _border(),
      ),
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
          width: 1.5,
        ),
      );
}

class SvgImageUtil extends StatelessWidget {
  final String image;
  final double height, width;

  const SvgImageUtil(
      {Key? key,
      required this.image,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      fit: BoxFit.fill,
    );
  }
}

class DividerUtil extends StatelessWidget {
  final Color? color;
  final double? thickness, height;

  const DividerUtil({Key? key, this.color, this.height, this.thickness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height ?? 0),
      child: Divider(
        color: color,
        thickness: thickness,
      ),
    );
  }
}

AppBar appBarUtil(
        {required String title,
        Widget? leading,
        List<Widget>? actions,
        bool? autoLeading,
        isCenter}) =>
    AppBar(
      title: TextUtil(
        text: title,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: whiteClr,
      ),
      centerTitle: isCenter,
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: autoLeading ?? false,
    );
