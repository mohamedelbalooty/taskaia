import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/utils/theme/colors.dart';
import 'package:taskaia/view/app_components.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: appBarUtil(
        title: 'Notification',
        leading: IconButtonUtil(
          icon: Icons.adaptive.arrow_back,
          color: whiteClr,
          iconSize: 26.sp,
          onClick: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: symmetricHorizontalPadding3(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace1(),
              SizedBox(
                width: infinityWidth,
                child: TextUtil(
                  text: 'Hello, Mohamed Gamal',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? whiteClr : blackClr,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace1(),
              SizedBox(
                width: infinityWidth,
                child: TextUtil(
                  text: 'You have a new reminder.',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ? whiteClr : Colors.grey,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace3(),
              Container(
                width: infinityWidth,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? lightBodyClr : blueClr,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 3.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.text_format,
                          size: 30.sp,
                          color: Get.isDarkMode ? darkBodyClr : lightBodyClr,
                        ),
                        horizontalSpace1(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextUtil(
                              text: 'Title :-',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color:
                                  Get.isDarkMode ? darkBodyClr : lightBodyClr,
                            ),
                            verticalSpace1(),
                            TextUtil(
                              text: 'Title no body here',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? darkBodyClr : lightBodyClr,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                    DividerUtil(
                        color: Get.isDarkMode ? darkBodyClr : lightBodyClr,
                        height: 2.0,
                        thickness: 2.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.description_outlined,
                          size: 30.sp,
                          color: Get.isDarkMode ? darkBodyClr : lightBodyClr,
                        ),
                        horizontalSpace1(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextUtil(
                                text: 'Description :-',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color:
                                    Get.isDarkMode ? darkBodyClr : lightBodyClr,
                              ),
                              verticalSpace1(),
                              TextUtil(
                                text:
                                    'Title no body here, Title no body here Title no body here Title no body here Title no body here Title no body here Title no body here',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    Get.isDarkMode ? darkBodyClr : lightBodyClr,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    DividerUtil(
                        color: Get.isDarkMode ? darkBodyClr : lightBodyClr,
                        height: 2.0,
                        thickness: 2.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 30.sp,
                          color: Get.isDarkMode ? darkBodyClr : lightBodyClr,
                        ),
                        horizontalSpace1(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextUtil(
                              text: 'Date :-',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color:
                                  Get.isDarkMode ? darkBodyClr : lightBodyClr,
                            ),
                            verticalSpace1(),
                            TextUtil(
                              text: '15/ 7/ 2022',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? darkBodyClr : lightBodyClr,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
