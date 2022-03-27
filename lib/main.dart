import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/routes/routes.dart';

void main(){
  runApp(const TaskaiaApp());
}

class TaskaiaApp extends StatelessWidget {
  const TaskaiaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taskaia App',
      initialRoute: Routes.initialRoute,
      getPages: Routes.pageRoutes,
    );
  }
}
