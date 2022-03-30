import 'package:flutter/material.dart';
import 'package:taskaia/utils/theme/colors.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: lightHeaderClr,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: lightBodyClr,
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: darkHeaderClr,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: darkBodyClr,
    brightness: Brightness.dark,
  );
}