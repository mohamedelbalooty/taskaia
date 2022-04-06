import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskaia/utils/routes/routes.dart';
import '../../controller/controllers/home_controller.dart';
import '../../utils/helper/notification_helper.dart';
import '../app_components.dart';
import '../../utils/helper/size_configuration_helper.dart';
import 'components.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    NotificationHelper.iosRequestPermission();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigurationHelper.initSizeConfiguration(context);
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [const BuildHomeAppBar()];
          },
          body: const BuildHomeBody(),
        ),
        floatingActionButton: FloatingActionButtonUtil(
          icon: Icons.add,
          onClick: () {
            _homeController.selectedTab == 0
                ? Get.toNamed(RoutesPath.createNoteView)
                : _homeController.selectedTab == 1
                    ? Get.toNamed(RoutesPath.createTaskView)
                    : Get.toNamed(RoutesPath.createMemoryView);
          },
        ),
      ),
    );
  }
}
