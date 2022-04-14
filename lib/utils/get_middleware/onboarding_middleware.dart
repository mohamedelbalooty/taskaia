import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../helper/storage_helper.dart';
import '../routes/routes.dart';

class OnboardingMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    if (StorageHelper.getBoolData(key: onboardingKey) == true) {
      return const RouteSettings(name: RoutesPath.homeView,);
    }
    return null;
  }
}
