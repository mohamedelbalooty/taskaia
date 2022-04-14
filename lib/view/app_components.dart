import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../utils/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/helper/size_configuration_helper.dart';

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

EdgeInsets symmetricVerticalPadding1() =>
    const EdgeInsets.symmetric(vertical: 10);

EdgeInsets symmetricVerticalPadding2() =>
    const EdgeInsets.symmetric(vertical: 15);

EdgeInsets symmetricHorizontalPadding1() =>
    const EdgeInsets.symmetric(horizontal: 10);

EdgeInsets symmetricHorizontalPadding2() =>
    const EdgeInsets.symmetric(horizontal: 15);

EdgeInsets symmetricHorizontalPadding3() =>
    const EdgeInsets.symmetric(horizontal: 20);

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
  final VoidCallback onClick;
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

class TextButtonUtil extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final Color color;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? decoration;
  final EdgeInsets? padding;
  final Function() onClick;

  const TextButtonUtil(
      {Key? key,
      required this.text,
      required this.onClick,
      this.color = whiteClr,
      this.fontSize = 16.0,
      this.fontWeight = FontWeight.normal,
      this.fontFamily,
      this.decoration,
      this.height,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: TextUtil(
        text: text,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: decoration,
        height: height,
      ),
      style: ButtonStyle(padding: MaterialStateProperty.all(padding)),
      onPressed: onClick,
    );
  }
}

class FloatingActionButtonUtil extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClick;

  const FloatingActionButtonUtil(
      {Key? key, required this.icon, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        icon,
        color: Get.isDarkMode ? whiteClr : blackClr,
        size: 34.sp,
      ),
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        borderSide: BorderSide(
          color: Get.isDarkMode ? whiteClr : blackClr,
          width: 2,
        ),
      ),
      tooltip: 'create'.tr,
      onPressed: onClick,
    );
  }
}

class DropdownMenuButtonUtil extends StatelessWidget {
  final List<String> items;
  final String value;
  final IconData icon;
  final Function(String?) onChanged;

  const DropdownMenuButtonUtil(
      {Key? key,
      required this.items,
      required this.value,
      required this.icon,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: items
          .map(
            (element) => DropdownMenuItem(
              value: element,
              child: TextUtil(
                text: element,
                color: Colors.red,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          .toList(),
      icon: Icon(
        icon,
        color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
        size: 24.sp,
      ),
      underline: const SizedBox(),
    );
  }
}

class BuildPopUpMenuButtonUtil extends StatelessWidget {
  final List<String> entries;
  final Widget icon;
  final Function(String) onSelected;
  final EdgeInsetsGeometry padding;

  const BuildPopUpMenuButtonUtil({
    Key? key,
    required this.entries,
    required this.icon,
    required this.onSelected,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PopupMenuEntry<String>> popEntry = [];
    return PopupMenuButton<String>(
      padding: padding,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(color: transparent),
      ),
      itemBuilder: (BuildContext context) {
        popEntry.clear();
        for (int i = 0; i < entries.length; i++) {
          popEntry.add(
            PopupMenuItem<String>(
              value: entries[i],
              child: Text(entries[i]),
              textStyle: TextStyle(
                color: Get.isDarkMode ? whiteClr : blackClr,
                fontWeight: FontWeight.w600
              ),
            ),
          );
        }
        return popEntry;
      },
      onSelected: onSelected,
      icon: icon,
      color: context.theme.appBarTheme.backgroundColor,
    );
  }
}

/// APP WIDGETS
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
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        height: height,
        decoration: decoration,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}

class TextFormFieldUtil extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? icon;
  final String? Function(String?) validate;
  final VoidCallback? onTap;
  final int maxLines;
  final double height;
  final bool readOnly, isSuffix;

  const TextFormFieldUtil({
    Key? key,
    required this.controller,
    required this.hint,
    required this.validate,
    this.icon,
    this.onTap,
    this.maxLines = 1,
    this.height = 14.0,
    this.readOnly = false,
    this.isSuffix = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      validator: validate,
      style: TextStyle(
        color: Get.isDarkMode ? whiteClr : blackClr,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      maxLines: maxLines,
      readOnly: readOnly,
      cursorColor: Get.isDarkMode ? whiteClr : lightHeaderClr,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 10.0, vertical: height),
        hintText: hint,
        hintStyle: TextStyle(
          color: Get.isDarkMode ? whiteClr : blackClr,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: isSuffix ? icon : const SizedBox(),
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
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
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

  const DividerUtil({Key? key, this.color, this.height, this.thickness = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height ?? 0.0),
      child: Divider(
        color: color,
        thickness: thickness,
      ),
    );
  }
}

class BuildTextInputItemWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final Widget? icon;
  final String? Function(String?) validate;
  final VoidCallback? onTap;
  final int maxLines;
  final bool readOnly, isSuffix;

  const BuildTextInputItemWidget({
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

class BuildColorPickerUtil extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onClick;
  final Widget child;

  const BuildColorPickerUtil(
      {Key? key,
      required this.buttonTitle,
      required this.onClick,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          (SizeConfigurationHelper.screenOrientation == Orientation.portrait)
              ? (SizeConfigurationHelper.screenHeight > 640.0)
                  ? 87.0
                  : 75.0
              : 91.0,
      width: infinityWidth,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
        child: Column(
          children: [
            Divider(
              color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
              thickness: 1.5,
              height: 0,
            ),
            const SizedBox(height: 2.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtil(
                        text: 'color'.tr,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? whiteClr : blackClr,
                        height: 1.2,
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        height: 28.0,
                        width: infinityWidth,
                        child: child,
                      ),
                    ],
                  ),
                ),
                horizontalSpace2(),
                ElevatedButtonUtil(
                  child: TextUtil(
                    text: buttonTitle,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? whiteClr : blackClr,
                  ),
                  color: context.theme.appBarTheme.backgroundColor!,
                  radius: 8.0,
                  onClick: onClick,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPaletteUtil extends StatelessWidget {
  final Color selectedColor;
  final bool isSelected;
  final VoidCallback onPickedColor;

  const ColorPaletteUtil(
      {Key? key,
      required this.selectedColor,
      required this.onPickedColor,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: selectedColor.withOpacity(0.5),
      splashColor: selectedColor.withOpacity(0.5),
      hoverColor: selectedColor.withOpacity(0.5),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        height: 30.0,
        width: 30.0,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: transparent,
          border: Border.all(color: selectedColor, width: 1.5),
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: selectedColor,
            shape: BoxShape.circle,
          ),
          child: isSelected
              ? Center(
                  child: Icon(
                    Icons.check,
                    size: 22.0,
                    color: Get.isDarkMode ? whiteClr : blackClr,
                  ),
                )
              : const SizedBox(),
        ),
      ),
      onTap: onPickedColor,
    );
  }
}

class AnimatedItemUtil extends StatelessWidget {
  final Widget child;
  final int indexPosition;

  const AnimatedItemUtil(
      {Key? key, required this.child, required this.indexPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: indexPosition,
      duration: const Duration(milliseconds: 1300),
      child: SlideAnimation(
        horizontalOffset: 300,
        child: FadeInAnimation(child: child),
      ),
    );
  }
}

class EmptyWidgetUtil extends StatelessWidget {
  final String image;

  const EmptyWidgetUtil({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgImageUtil(
        image: image,
        height: 200.h,
        width: 200.w,
      ),
    );
  }
}

class BorderUtil extends StatelessWidget {
  final Widget child;
  final Color color;
  final double? height, width;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final bool isAllBorder;
  final double radius, topRight, topLeft, bottomLeft, bottomRight;

  const BorderUtil(
      {Key? key,
      required this.child,
      required this.color,
      this.height,
      this.width,
      this.padding,
      this.constraints,
      this.isAllBorder = true,
      this.radius = 12.0,
      this.topRight = 12.0,
      this.topLeft = 12.0,
      this.bottomLeft = 12.0,
      this.bottomRight = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.zero,
      constraints: constraints,
      decoration: BoxDecoration(
        color: color,
        borderRadius: isAllBorder == true
            ? BorderRadius.circular(radius)
            : BorderRadius.only(
                topRight: Radius.circular(topRight),
                topLeft: Radius.circular(topLeft),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight),
              ),
        border: Border.all(
          color: Get.isDarkMode ? whiteClr : blackClr,
          width: 2.0,
        ),
      ),
      child: child,
    );
  }
}

class BuildBottomSheetUtil extends StatelessWidget {
  final VoidCallback onUpdate, onDelete;
  final String? updateTitle;

  const BuildBottomSheetUtil(
      {Key? key,
      required this.onUpdate,
      required this.onDelete,
      this.updateTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      width: infinityWidth,
      margin: symmetricHorizontalPadding2(),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfigurationHelper.screenWidth * 0.25),
              child: const Divider(color: greyClr, thickness: 5.0),
            ),
            const SizedBox(height: 5.0),
            ElevatedButtonUtil(
              size: Size(infinityWidth, 50.0),
              radius: 8.0,
              color: context.theme.appBarTheme.backgroundColor!,
              child: TextUtil(
                text: updateTitle ?? 'update'.tr,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? whiteClr : blackClr,
              ),
              onClick: onUpdate,
            ),
            const SizedBox(height: 5.0),
            const Spacer(),
            ElevatedButtonUtil(
              size: Size(infinityWidth, 50.0),
              radius: 8.0,
              color: context.theme.appBarTheme.backgroundColor!,
              child: TextUtil(
                text: 'delete'.tr,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? whiteClr : blackClr,
              ),
              onClick: onDelete,
            ),
            const DividerUtil(color: greyClr, thickness: 2.0),
            ElevatedButtonUtil(
                size: Size(infinityWidth, 50.0),
                radius: 8.0,
                color: context.theme.appBarTheme.backgroundColor!,
                child: TextUtil(
                  text: 'cancel'.tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? whiteClr : blackClr,
                ),
                onClick: () => Get.back())
          ],
        ),
      ),
    );
  }
}

/// SHOWING FUNCTIONS

AppBar appBarUtil(
        {required String title,
        Widget? leading,
        List<Widget>? actions,
        bool? autoLeading}) =>
    AppBar(
      title: TextUtil(
        text: title,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? whiteClr : blackClr,
      ),
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: autoLeading ?? false,
    );

Future<DateTime?> showDatetimePicker(
  BuildContext context, {
  required DateTime initialDate,
}) async {
  DateTime? pickedDatetime = await showDatePicker(
      context: context,
      builder: (context, child) => Theme(
          data: ThemeData().copyWith(
              colorScheme: ColorScheme.light(
            primary: Get.isDarkMode ? darkHeaderClr : lightHeaderClr,
            surface: Get.isDarkMode ? darkBodyClr : lightBodyClr,
            onPrimary: Get.isDarkMode ? whiteClr : blackClr,
          )),
          child: child!),
      initialDate: initialDate,
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
      cancelText: 'cancel'.tr,
      confirmText: 'ok'.tr);
  return pickedDatetime;
}

Future<TimeOfDay?> showTimingPicker(
  BuildContext context, {
  required bool isStartTime,
}) async {
  TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      builder: (context, child) => Theme(
          data: ThemeData().copyWith(
              colorScheme: ColorScheme.light(
            primary: Get.isDarkMode ? darkHeaderClr : lightHeaderClr,
            surface: Get.isDarkMode ? darkBodyClr : lightBodyClr,
            onPrimary: Get.isDarkMode ? whiteClr : blackClr,
            onSurface: Get.isDarkMode ? whiteClr : blackClr,
            onBackground: Get.isDarkMode ? whiteClr : blackClr,
          )),
          child: child!),
      initialTime: isStartTime
          ? TimeOfDay.now()
          : TimeOfDay.fromDateTime(
              DateTime.now().add(const Duration(minutes: 15)),
            ),
      cancelText: 'cancel'.tr,
      confirmText: 'ok'.tr);
  return pickedTime;
}

void showBottomSheetUtil({required Widget bottomSheetWidget}) {
  Get.bottomSheet(
    bottomSheetWidget,
  );
}

SnackbarController showSnackBar(
    {required String title, required String message}) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Get.isDarkMode ? darkHeaderClr : lightHeaderClr,
    borderRadius: 12.0,
    padding: padding2(),
    margin: const EdgeInsets.all(10.0),
    duration: const Duration(seconds: 3),
    colorText: Get.isDarkMode ? whiteClr : blackClr,
  );
}
