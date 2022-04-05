import 'package:flutter/material.dart';
import 'package:taskaia/utils/theme/colors.dart';
import 'palette.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightHeaderClr,
    primarySwatch: Palette.swatchLightColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: lightHeaderClr,
      //for stepper widget color
      primarySwatch: Palette.swatchLightColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightHeaderClr,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: lightBodyClr,
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkHeaderClr,
    primarySwatch: Palette.swatchDarkColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: darkHeaderClr,
      primarySwatch: Palette.swatchDarkColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkHeaderClr,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: darkBodyClr,
    brightness: Brightness.dark,
  );
}
