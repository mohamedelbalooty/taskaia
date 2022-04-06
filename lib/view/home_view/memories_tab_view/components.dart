import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../model/memory.dart';
import '../../../utils/theme/colors.dart';
import '../../app_components.dart';

Step buildStepWidget({required Memory memory}) {
  return Step(
    title: TextUtil(
      text: memory.title,
      fontSize: 18.sp,
      color: Get.isDarkMode ? whiteClr : blackClr,
      fontWeight: FontWeight.bold,
    ),
    subtitle: TextUtil(
      text: memory.dateTime,
      fontSize: 14.sp,
      color: Get.isDarkMode ? whiteClr : blackClr,
      fontWeight: FontWeight.w500,
    ),
    content: AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 1300),
      child: SlideAnimation(
        horizontalOffset: 300,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: pinkClr,
          ),
          child: TextUtil(
            text: memory.content,
            fontSize: 16.sp,
            color: whiteClr,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    ),
    isActive: true,
    state: StepState.indexed,
  );
}

// class BuildStepControlWidget extends StatelessWidget {
//   const BuildStepControlWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         ElevatedButtonUtil(
//           child: TextUtil(
//               text: 'Next',
//               fontSize: 16.sp,
//               fontWeight: FontWeight.normal,
//               color: whiteClr),
//           radius: 8.0,
//           color: Theme.of(context).appBarTheme.backgroundColor!,
//           onClick: () {
//             if (_index > 0) {
//               setState(() {
//                 _index -= 1;
//               });
//             }
//           },
//           size: const Size(50, 30),
//         ),
//         (_index == 0)
//             ? const SizedBox()
//             : ElevatedButtonUtil(
//           child: TextUtil(
//               text: 'Previous',
//               fontSize: 16.sp,
//               fontWeight: FontWeight.normal,
//               color: whiteClr),
//           radius: 8.0,
//           color: Theme.of(context).appBarTheme.backgroundColor!,
//           onClick: () {
//             if (_index <= 0) {
//               setState(() {
//                 _index += 1;
//               });
//             }
//           },
//           size: const Size(50, 30),
//         ),
//       ],
//     );
//   }
// }
