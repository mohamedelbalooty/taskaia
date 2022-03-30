import 'package:get/get.dart';
import 'package:taskaia/view/create_note_view/create_note_view.dart';
import '../../controller/bindings/home_binding.dart';
import '../../view/create_memory_view/create_memory_view.dart';
import '../../view/create_task_view/create_task_view.dart';
import '../../view/home_view/home_view.dart';
import '../../view/notification_view/notification_view.dart';

class Routes {
  static const String initialRoute = RoutesPath.homeView;

  // static const String initialRoute = RoutesPath.createTaskView;
  static List<GetPage> pageRoutes = [
    GetPage(
      name: RoutesPath.homeView,
      page: () => HomeView(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: RoutesPath.notificationView,
      page: () => const NotificationView(),
    ),
    GetPage(
      name: RoutesPath.createNoteView,
      page: () => const CreateNoteView(),
    ),
    GetPage(
      name: RoutesPath.createTaskView,
      page: () => const CreateTaskView(),
    ),
    GetPage(
      name: RoutesPath.createMemoryView,
      page: () => const CreateMemoryView(),
    ),
  ];
}

class RoutesPath {
  static const String homeView = '/homeView';
  static const String notificationView = '/notificationView';
  static const String createNoteView = '/createNoteView';
static const String createTaskView = '/createTaskView';
static const String createMemoryView = '/createMemoryView';

}
