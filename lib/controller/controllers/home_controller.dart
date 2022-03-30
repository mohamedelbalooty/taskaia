import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedTab = 0;

  void onTabChanged(int currentIndex) {
    selectedTab = currentIndex;
    update();
  }
}
