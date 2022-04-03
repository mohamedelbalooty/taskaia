import 'package:flutter/material.dart';
import 'package:taskaia/utils/theme/colors.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightHeaderClr,
    colorScheme: ColorScheme.fromSwatch(accentColor: lightHeaderClr, brightness: Brightness.light),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightHeaderClr,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: lightBodyClr,
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkHeaderClr,
    colorScheme: ColorScheme.fromSwatch(accentColor: darkHeaderClr, brightness: Brightness.dark),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkHeaderClr,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: darkBodyClr,
    brightness: Brightness.dark,
  );
}