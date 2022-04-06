import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskaia/controller/controllers/home_controller.dart';
import '../../controller/controllers/theme_controller.dart';
import '../../utils/helper/notification_helper.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';
import 'memories_tab_view/memories_tab_view.dart';
import 'notes_tab_view/notes_tab_view.dart';
import 'tasks_tab_view/tasks_tab_view.dart';

class BuildHomeAppBar extends GetView<HomeController> {
  const BuildHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      title: TextUtil(
        text: 'Taskaia',
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: whiteClr,
      ),
      centerTitle: true,
      leading: IconButtonUtil(
        icon: Get.isDarkMode ? Icons.brightness_2 : Icons.brightness_2_outlined,
        color: whiteClr,
        iconSize: 26.sp,
        // onClick: () => ThemeController().changeThemeMode(),
        onClick: (){
          NotificationHelper.displayNotification(title: 'title', body: 'body');
          // NotificationHelper.scheduleNotification(title: 'title', body: 'body');
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(
            'assets/images/logo.png',
            height: kBottomNavigationBarHeight,
            width: kBottomNavigationBarHeight,
          ),
        ),
      ],
      bottom: TabBar(
        indicatorColor: Colors.grey.shade300,
        indicatorWeight: Get.isDarkMode ? 2.5 : 3,
        labelColor: whiteClr,
        labelStyle: Get.deviceLocale!.languageCode == 'en'
            ? GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Get.isDarkMode ? whiteClr : blackClr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            : GoogleFonts.cairo(
                textStyle: TextStyle(
                  color: Get.isDarkMode ? whiteClr : blackClr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
        tabs: const [
          Tab(text: 'Notes'),
          Tab(text: 'Tasks'),
          Tab(text: 'Memories'),
        ],
        onTap: (int currentIndex) => controller.onTabChanged(currentIndex),
        isScrollable: false,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class BuildHomeBody extends StatelessWidget {
  const BuildHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        NotesTabView(),
        TasksTabView(),
        MemoriesTabView(),
      ],
    );
  }
}
