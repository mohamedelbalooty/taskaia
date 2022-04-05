import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor swatchLightColor = MaterialColor(
    0xff1D3DB9,
    <int, Color>{
      50: Color(0xff1a37a7), //10%
      100: Color(0xff173194), //20%
      200: Color(0xff142b82), //30%
      300: Color(0xff11256f), //40%
      400: Color(0xff0f1f5d), //50%
      500: Color(0xff0c184a), //60%
      600: Color(0xff091237), //70%
      700: Color(0xff060c25), //80%
      800: Color(0xff030612), //90%
      900: Color(0xff000000), //100%
    },
  );
  static const MaterialColor swatchDarkColor = MaterialColor(
    0xff1D3DB9,
    <int, Color>{
      50: Color(0xff0e2031), //10%
      100: Color(0xff0d1d2b), //20%
      200: Color(0xff0b1926), //30%
      300: Color(0xff0a1620), //40%
      400: Color(0xff08121b), //50%
      500: Color(0xff060e16), //60%
      600: Color(0xff050b10), //70%
      700: Color(0xff03070b), //80%
      800: Color(0xff020405), //90%
      900: Color(0xff000000), //100%
    },
  );

  ///FROM https://maketintsandshades.com/#102436
  ///YOU CAN WATCH THIS ARTICLE https://dev.to/rohanjsh/custom-swatch-for-material-app-theme-primaryswatch-3kic
}
