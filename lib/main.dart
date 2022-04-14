import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/controllers/language_controller.dart';
import 'controller/controllers/theme_controller.dart';
import 'utils/get_service/get_service.dart';
import 'utils/localization/localization.dart';
import 'utils/routes/routes.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializationService();
  runApp(const TaskaiaApp());
}

Future initializationService() async {
  await Get.putAsync(() => GetService().init());
}

class TaskaiaApp extends StatelessWidget {
  const TaskaiaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taskaia',
        initialRoute: Routes.initialRoute,
        getPages: Routes.pageRoutes,
        locale: Locale(LanguageController().localLang),
        fallbackLocale: Get.deviceLocale,
        translations: AppLocalization(),
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeController().themeMode,
      ),
    );
  }
}
