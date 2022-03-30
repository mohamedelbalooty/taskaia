import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskaia/utils/routes/routes.dart';
import 'package:taskaia/utils/theme/colors.dart';
import '../../controller/controllers/home_controller.dart';
import '../app_components.dart';
import 'components.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: CustomScrollView(
          slivers: [
            BuildHomeAppBar(),
            const BuildHomeBody(),
          ],
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
