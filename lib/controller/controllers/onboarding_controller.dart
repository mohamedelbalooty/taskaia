import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingController extends GetxController {
  late LiquidController liquidController;
  int page = 0;

  void onPageChanged(int value) {
    page = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    liquidController = LiquidController();
  }
}
