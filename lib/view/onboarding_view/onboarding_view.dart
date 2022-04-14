import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:taskaia/controller/controllers/onboarding_controller.dart';
import '../../utils/helper/size_configuration_helper.dart';
import '../../utils/theme/colors.dart';
import 'components.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfigurationHelper.initSizeConfiguration(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          LiquidSwipe(
            liquidController: controller.liquidController,
            enableSideReveal: true,
            slideIconWidget: const Padding(
              padding: EdgeInsetsDirectional.only(start: 5.0, top: 10.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: whiteClr,
                size: 22.0,
              ),
            ),
            onPageChangeCallback: (int index) =>
                controller.onPageChanged(index),
            pages: [
              BuildOnboardingPage(
                  title: 'onboarding_1'.tr,
                  image: 'assets/images/onboarding1.svg',
                  colors: const [Colors.red, lightHeaderClr]),
              BuildOnboardingPage(
                  title: 'onboarding_2'.tr,
                  image: 'assets/images/onboarding2.svg',
                  colors: const [Colors.white, lightHeaderClr]),
              BuildOnboardingPage(
                  title: 'onboarding_3'.tr,
                  image: 'assets/images/onboarding3.svg',
                  colors: const [Colors.tealAccent, lightHeaderClr]),
            ],
          ),
          const BuildOnboardingBottomBar(),
        ],
      ),
    );
  }
}
