import 'package:flutter/cupertino.dart';

class SizeConfiguration{
  static late MediaQueryData mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late Orientation screenOrientation;
  void init(BuildContext context){
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData.size.height;
    screenWidth = mediaQueryData.size.width;
    screenOrientation = mediaQueryData.orientation;
  }
}

double getProportionateHeight(double inputHeight){
  double screenHeight = SizeConfiguration.screenHeight;
  ///812.0 the height of layout designer use
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateWidth(double inputWidth){
  double screenWidth = SizeConfiguration.screenWidth;
  ///375.0 the width of layout designer use
  return (inputWidth / 375.0) * screenWidth;
}