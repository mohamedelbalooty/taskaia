import 'package:get/get.dart';
import '../../view/home_view/home_view.dart';

class Routes {
  static const String initialRoute = RoutesPath.homeView;
  static List<GetPage> pageRoutes = [
    GetPage(
      name: RoutesPath.homeView,
      page: () => const HomeView(),
    ),
    // GetPage(
    //   name: RoutesPath.homeView,
    //   page: () => const HomeView(),
    // ),
    // GetPage(
    //   name: RoutesPath.homeView,
    //   page: () => const HomeView(),
    // ),
  ];
}

class RoutesPath {
  static const String homeView = '/homeView';
}
