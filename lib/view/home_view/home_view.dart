import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskaia/controller/bindings/create_memory_binding.dart';
import 'package:taskaia/controller/bindings/create_note_binding.dart';
import 'package:taskaia/view/create_memory_view/create_memory_view.dart';
import 'package:taskaia/view/create_note_view/create_note_view.dart';
import '../../controller/bindings/create_task_binding.dart';
import '../../controller/controllers/home_controller.dart';
import '../../utils/helper/notification_helper.dart';
import '../app_components.dart';
import '../../utils/helper/size_configuration_helper.dart';
import '../create_task_view/create_task_view.dart';
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
                ? Get.to(() => CreateNoteView(), binding: CreateNoteBinding(isCreated: false))
                : _homeController.selectedTab == 1
                    ? Get.to(() => CreateTaskView(),
                        binding: CreateTaskBinding(isCreated: false))
                    : Get.to(() => CreateMemoryView(),
                        binding: CreateMemoryBinding(isCreated: false));
          },
        ),
      ),
    );
  }
}
