import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        color: whiteClr,
        size: 32.sp,
      ),
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
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
              textStyle: Get.deviceLocale!.languageCode == 'en'
                  ? GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: whiteClr,
                      ),
                    )
                  : GoogleFonts.cairo(
                      textStyle: const TextStyle(
                        color: whiteClr,
                      ),
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
    this.height = 16.0,
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
        color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      maxLines: maxLines,
      readOnly: readOnly,
      cursorColor: Get.isDarkMode ? whiteClr : lightHeaderClr,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 10.0, vertical: height),
        hintText: hint,
        hintStyle: TextStyle(
          color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
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
              ? SizeConfigurationHelper.screenHeight > 640.0
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
                        text: 'Color',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? whiteClr : blackClr,
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
                    color: whiteClr,
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
              ? const Center(
                  child: Icon(
                    Icons.check,
                    size: 22.0,
                    color: whiteClr,
                  ),
                )
              : const SizedBox(),
        ),
      ),
      onTap: onPickedColor,
    );
  }
}

// class ResponsiveListUtil extends StatelessWidget {
//   final Widget child;
//   final int itemCount, columnCount;
//   final EdgeInsetsGeometry padding;
//   final bool shrinkWrap;
//   final ScrollPhysics physics;
//
//   const ResponsiveListUtil({
//     Key? key,
//     required this.child,
//     required this.itemCount,
//     this.columnCount = 2,
//     this.padding = EdgeInsets.zero,
//     this.shrinkWrap = false,
//     this.physics = const BouncingScrollPhysics(),
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (_, constraints) {
//         if (SizeConfigurationHelper.screenOrientation == Orientation.portrait) {
//           return ListView.separated(
//             padding: padding,
//             shrinkWrap: shrinkWrap,
//             physics: physics,
//             itemCount: itemCount,
//             itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
//               position: index,
//               duration: const Duration(milliseconds: 1300),
//               child: SlideAnimation(
//                 horizontalOffset: 300,
//                 child: FadeInAnimation(child: child),
//               ),
//             ),
//             separatorBuilder: (_, index) => verticalSpace2(),
//           );
//         }
//         return GridView.builder(
//           padding: padding,
//           shrinkWrap: shrinkWrap,
//           physics: physics,
//           itemCount: itemCount,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: columnCount,
//               mainAxisSpacing: 10.h,
//               crossAxisSpacing: 10.w,
//               childAspectRatio: 1.3),
//           itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
//             columnCount: 2,
//             position: index,
//             duration: const Duration(milliseconds: 1375),
//             child: SlideAnimation(
//               horizontalOffset: 300,
//               child: FadeInAnimation(child: child),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class ResponsiveListUtil extends StatelessWidget {
  final Widget child;
  final int indexPosition;

  const ResponsiveListUtil(
      {Key? key, required this.child, required this.indexPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return AnimationConfiguration.staggeredList(
          position: indexPosition,
          duration: const Duration(milliseconds: 1300),
          child: SlideAnimation(
            horizontalOffset: 300,
            child: FadeInAnimation(child: child),
          ),
        );
        // if (SizeConfigurationHelper.screenOrientation == Orientation.portrait) {
        //   return AnimationConfiguration.staggeredList(
        //     position: indexPosition,
        //     duration: const Duration(milliseconds: 1300),
        //     child: SlideAnimation(
        //       horizontalOffset: 300,
        //       child: FadeInAnimation(child: child),
        //     ),
        //   );
        // }
        // return GridView.builder(
        //   padding: padding,
        //   shrinkWrap: shrinkWrap,
        //   physics: physics,
        //   itemCount: itemCount,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: columnCount,
        //       mainAxisSpacing: 10.h,
        //       crossAxisSpacing: 10.w,
        //       childAspectRatio: 1.3),
        //   itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
        //     columnCount: 2,
        //     position: index,
        //     duration: const Duration(milliseconds: 1375),
        //     child: SlideAnimation(
        //       horizontalOffset: 300,
        //       child: FadeInAnimation(child: child),
        //     ),
        //   ),
        // );
      },
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

Future<DateTime?> showDatetimePicker(
  BuildContext context, {
  required DateTime initialDate,
}) async {
  DateTime? pickedDatetime = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2016),
    lastDate: DateTime.now(),
  );
  return pickedDatetime;
}

Future<TimeOfDay?> showTimingPicker(
  BuildContext context, {
  required bool isStartTime,
}) async {
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: isStartTime
        ? TimeOfDay.now()
        : TimeOfDay.fromDateTime(
            DateTime.now().add(const Duration(minutes: 15)),
          ),
  );
  return pickedTime;
}

void showBottomSheetUtil({required Widget bottomSheetWidget}) {
  Get.bottomSheet(
    bottomSheetWidget,
  );
}

SnackbarController showSnackBar(
    {required String title, required String message, SnackPosition? position}) {
  return Get.snackbar(
    title,
    message,
    snackPosition: position,
    backgroundColor: Get.isDarkMode ? darkHeaderClr : lightHeaderClr,
    borderRadius: 5.0,
    padding: symmetricHorizontalPadding1(),
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 2),
    colorText: whiteClr,
  );
}