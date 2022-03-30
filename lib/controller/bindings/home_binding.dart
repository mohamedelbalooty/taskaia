import 'package:get/get.dart';
import 'package:taskaia/controller/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
  }
}