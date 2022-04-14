import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskaia/utils/helper/size_configuration_helper.dart';
import '../../controller/controllers/onboarding_controller.dart';
import '../../utils/routes/routes.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';

class BuildOnboardingPage extends StatelessWidget {
  final String title, image;
  final List<Color> colors;

  const BuildOnboardingPage(
      {Key? key,
      required this.title,
      required this.image,
      required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: infinityHeight,
      width: infinityWidth,
      padding: const EdgeInsetsDirectional.only(start: 31.0, end: 15.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (SizeConfigurationHelper.screenOrientation == Orientation.portrait)
              ? SvgImageUtil(image: image, height: 200.h, width: 200.w)
              : SvgImageUtil(image: image, height: 110.h, width: 110.w),
          verticalSpace5(),
          Padding(
            padding: symmetricHorizontalPadding2(),
            child: TextUtil(
              text: title,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              fontSize: (SizeConfigurationHelper.screenOrientation ==
                      Orientation.portrait)
                  ? 18.sp
                  : 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildOnboardingBottomBar extends GetView<OnboardingController> {
  const BuildOnboardingBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.h,
      left: 16.0,
      right: (SizeConfigurationHelper.screenOrientation == Orientation.portrait)
          ? 32.0
          : 50.0,
      child: Container(
        height: 50.h,
        decoration: const BoxDecoration(
          color: whiteClr,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: GetBuilder<OnboardingController>(builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButtonUtil(
                  text: 'skip'.tr.toUpperCase(),
                  color: controller.liquidController.currentPage == 2 ? transparent :lightHeaderClr,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  onClick: () {
                    controller.liquidController.currentPage == 2 ? (){} :
                    Get.offNamedUntil(RoutesPath.homeView, (route) => false);
                  }),
              AnimatedSmoothIndicator(
                activeIndex: controller.page,
                count: 3,
                effect: const WormEffect(
                  dotHeight: 13.0,
                  dotWidth: 13.0,
                  dotColor: Colors.grey,
                  activeDotColor: lightHeaderClr,
                ),
              ),
              TextButtonUtil(
                  text: controller.liquidController.currentPage == 2
                      ? 'get_started'.tr
                      : 'next'.tr.toUpperCase(),
                  color: lightHeaderClr,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  onClick: () {
                    final int page =
                        controller.liquidController.currentPage + 1;
                    controller.liquidController.currentPage == 2
                        ? Get.offNamedUntil(
                            RoutesPath.homeView, (route) => false)
                        : controller.liquidController
                            .animateToPage(page: page, duration: 400);
                  }),
            ],
          );
        }),
      ),
    );
  }
}
