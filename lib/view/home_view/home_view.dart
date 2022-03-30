import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body:  CustomScrollView(
          slivers: [
            BuildHomeAppBar(),
            const BuildHomeBody(),
          ],
        ),
      ),
    );
  }
}


