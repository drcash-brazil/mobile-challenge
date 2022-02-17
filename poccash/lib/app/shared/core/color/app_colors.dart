import 'package:flutter/material.dart';

class AppColors {
  static int strColorPrimary = 0xff083b4c;
  static Color? colorPrimary = Color(strColorPrimary);

  static Color colorGreen = Colors.green;
  static Color colorRed = Colors.red;
  static Color colorYellow = Colors.yellow;
  static Color colorWhite = Colors.white;

  static MaterialColor green = MaterialColor(
    strColorPrimary,
    <int, Color>{
      50: Color(strColorPrimary),
      100: Color(strColorPrimary),
      200: Color(strColorPrimary),
      300: Color(strColorPrimary),
      400: Color(strColorPrimary),
      500: Color(strColorPrimary),
      600: Color(strColorPrimary),
      700: Color(strColorPrimary),
      800: Color(strColorPrimary),
      900: Color(strColorPrimary),
    },
  );
}
