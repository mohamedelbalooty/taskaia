import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskaia/controller/bindings/create_memory_binding.dart';
import 'package:taskaia/controller/bindings/create_note_binding.dart';
import 'package:taskaia/view/create_memory_view/create_memory_view.dart';
import 'package:taskaia/view/create_note_view/create_note_view.dart';
import '../../controller/bindings/create_task_binding.dart';
import '../../controller/controllers/home_controller.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';
import '../../utils/helper/size_configuration_helper.dart';
import '../create_task_view/create_task_view.dart';
import 'components.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

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
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: false,
                title: TextUtil(
                  text: 'app_title'.tr,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? whiteClr : blackClr,
                ),
                centerTitle: true,
                actions: [
                  GetBuilder<HomeController>(builder: (context) {
                    if (controller.isOpenedDrawer) {
                      return const SizedBox();
                    }
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: kBottomNavigationBarHeight,
                        width: kBottomNavigationBarHeight,
                      ),
                    );
                  }),
                ],
                bottom: TabBar(
                  indicatorColor: Get.isDarkMode ? whiteClr : blackClr,
                  indicatorWeight: Get.isDarkMode ? 2.5 : 3,
                  labelColor: Get.isDarkMode ? whiteClr : blackClr,
                  unselectedLabelColor: Get.isDarkMode
                      ? whiteClr.withOpacity(0.7)
                      : blackClr.withOpacity(0.7),
                  labelStyle: TextStyle(
                    color: Get.isDarkMode ? whiteClr : blackClr,
                    fontSize: 18.sp,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: 'notes'.tr),
                    Tab(text: 'tasks'.tr),
                    Tab(text: 'memories'.tr),
                  ],
                  onTap: (int currentIndex) =>
                      controller.onTabChanged(currentIndex),
                  isScrollable: false,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              )
            ];
          },
          body: const BuildHomeBody(),
        ),
        drawer: const BuildHomeDrawerWidget(),
        onDrawerChanged: (bool isOpened) => controller.onDrawerChange(isOpened),
        floatingActionButton: FloatingActionButtonUtil(
          icon: Icons.add,
          onClick: () {
            controller.selectedTab == 0
                ? Get.to(() => CreateNoteView(),
                    binding: CreateNoteBinding(isCreated: false))
                : controller.selectedTab == 1
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
