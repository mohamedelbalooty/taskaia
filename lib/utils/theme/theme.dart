import 'package:flutter/material.dart';
import 'package:taskaia/utils/theme/colors.dart';
import 'palette.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightHeaderClr,
    primarySwatch: Palette.swatchLightColor,
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: lightHeaderClr),
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSwatch(
      accentColor: lightHeaderClr,
      primarySwatch: Palette.swatchLightColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightHeaderClr,
      centerTitle: true,
      iconTheme: IconThemeData(color: blackClr),
    ),
    scaffoldBackgroundColor: lightBodyClr,
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkHeaderClr,
    primarySwatch: Palette.swatchDarkColor,
    textSelectionTheme:
    const TextSelectionThemeData(selectionColor: darkHeaderClr),
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSwatch(
      accentColor: darkHeaderClr,
      primarySwatch: Palette.swatchDarkColor,
      primaryColorDark: darkHeaderClr,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkHeaderClr,
      centerTitle: true,
      iconTheme: IconThemeData(color: whiteClr),
    ),
    scaffoldBackgroundColor: darkBodyClr,
    brightness: Brightness.dark,
  );
}
