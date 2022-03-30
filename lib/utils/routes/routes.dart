import 'package:get/get.dart';
import '../../controller/bindings/home_binding.dart';
import '../../view/create_task_view/create_task_view.dart';
import '../../view/home_view/home_view.dart';
import '../../view/notification_view/notification_view.dart';

class Routes {
  static const String initialRoute = RoutesPath.homeView;

  // static const String initialRoute = RoutesPath.createTaskView;
  static List<GetPage> pageRoutes = [
    GetPage(
      name: RoutesPath.homeView,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: RoutesPath.notificationView,
      page: () => const NotificationView(),
    ),
    GetPage(
      name: RoutesPath.createTaskView,
      page: () => const CreateTaskView(),
    ),
  ];
}

class RoutesPath {
  static const String homeView = '/homeView';
  static const String notificationView = '/notificationView';
  static const String createTaskView = '/createTaskView';
// static const String createTaskView = '/createTaskView';
// static const String createTaskView = '/createTaskView';

}
