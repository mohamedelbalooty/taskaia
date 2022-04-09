import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/controller/controllers/create_note_controller.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';

class PickImageWidget extends GetView<CreateNoteController> {
  const PickImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtil(
          text: 'Image',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? whiteClr : blackClr,
        ),
        verticalSpace1(),
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: GetBuilder<CreateNoteController>(builder: (context) {
            return Container(
              height: 110.w,
              width: 110.w,
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                border: Border.all(
                  color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                  width: 1.5,
                ),
              ),
              child: controller.pickedImage == null
                  ? Icon(
                      Icons.add_a_photo_outlined,
                      size: 40.sp,
                      color: Get.isDarkMode ? Colors.grey.shade300 : blackClr,
                    )
                  : ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.file(
                        controller.pickedImage!,
                        fit: BoxFit.fill,
                      ),
                    ),
            );
          }),
          onTap: () async {
            await controller.onPickImage();
          },
        ),
      ],
    );
  }
}
