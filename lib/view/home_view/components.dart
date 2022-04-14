import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/controllers/language_controller.dart';
import '../../controller/controllers/theme_controller.dart';
import '../../utils/constants.dart';
import '../../utils/helper/size_configuration_helper.dart';
import '../../utils/helper/storage_helper.dart';
import '../../utils/theme/colors.dart';
import '../app_components.dart';
import 'memories_tab_view/memories_tab_view.dart';
import 'notes_tab_view/notes_tab_view.dart';
import 'tasks_tab_view/tasks_tab_view.dart';

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

class BuildHomeDrawerWidget extends StatelessWidget {
  const BuildHomeDrawerWidget({Key? key}) : super(key: key);

  List<IconButtonUtil> _drawerIcons() {
    return [
      IconButtonUtil(
        color: Get.isDarkMode ? whiteClr : blackClr,
        iconSize: 30.sp,
        icon: Icons.live_help,
        onClick: () => Get.defaultDialog(
          title: 'about_app'.tr,
          content: TextUtil(
            text: 'about_app_description'.tr,
            fontSize: 16.sp,
            color: Get.isDarkMode ? whiteClr : blackClr,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          titleStyle: TextStyle(
            fontSize: 18.sp,
            color: Get.isDarkMode ? whiteClr : blackClr,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Get.isDarkMode ? darkHeaderClr : lightHeaderClr,
          radius: 12.0,
          confirm: ElevatedButtonUtil(
            child: TextUtil(
              text: 'ok'.tr,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? blackClr : whiteClr,
            ),
            color: Get.isDarkMode ? whiteClr : blackClr,
            size: const Size(100.0,40.0),
            radius: 5.0,
            onClick: () => Get.back(),
          ),
        ),
      ),
      IconButtonUtil(
          color: Get.isDarkMode ? whiteClr : blackClr,
          iconSize: 30.sp,
          icon: Icons.lock,
          onClick: () => launchURL(
                  'https://github.com/mohamedelbalooty/Taskaia_Privacy_Policy.git')
              .then((value) => Get.back())),
      IconButtonUtil(
          color: Get.isDarkMode ? whiteClr : blackClr,
          iconSize: 30.sp,
          icon: Icons.language,
          onClick: () {
            LanguageController().onChangeLang(
                StorageHelper.getStringData(key: languageKey) == 'ar'
                    ? 'en'
                    : 'ar');
          }),
      IconButtonUtil(
          color: Get.isDarkMode ? whiteClr : blackClr,
          iconSize: 30.sp,
          icon: Icons.brightness_2,
          onClick: () => ThemeController().changeThemeMode()),
      IconButtonUtil(
        color: Get.isDarkMode ? whiteClr : blackClr,
        iconSize: 30.sp,
        icon: Icons.email_rounded,
        onClick: () =>
            launchURL('mailto:mohamedelbalooty123@gmail.com?%20subject&%20body')
                .then((value) => Get.back()),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfigurationHelper.screenHeight,
      width: 80.w,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: context.theme.appBarTheme.backgroundColor,
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 0),
              spreadRadius: 2,
              blurRadius: 5)
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top + 5.h),
            Image.asset(
              'assets/images/logo.png',
              height: kBottomNavigationBarHeight,
              width: kBottomNavigationBarHeight,
            ),
            verticalSpace3(),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _drawerIcons().length,
              itemBuilder: (_, index) => _drawerIcons()[index],
              separatorBuilder: (_, index) => DividerUtil(
                color: Get.isDarkMode ? blackClr : whiteClr,
                thickness: 2.0,
                height: 5.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch';
  }
}
