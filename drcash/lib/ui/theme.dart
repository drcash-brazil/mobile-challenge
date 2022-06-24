// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppTheme {
  static const PRIMARY_COLOR = MaterialColor(
    0xFF0BA5A8,
    {
      50: Color.fromRGBO(11, 165, 168, .1),
      100: Color.fromRGBO(11, 165, 168, .2),
      200: Color.fromRGBO(11, 165, 168, .3),
      300: Color.fromRGBO(11, 165, 168, .4),
      400: Color.fromRGBO(11, 165, 168, .5),
      500: Color.fromRGBO(11, 165, 168, .6),
      600: Color.fromRGBO(11, 165, 168, .7),
      700: Color.fromRGBO(11, 165, 168, .8),
      800: Color.fromRGBO(11, 165, 168, .9),
      900: Color.fromRGBO(11, 165, 168, 1),
    },
  );

  static const PRIMARY_COLOR_DARK = Color(0xFF073B4C);

  // Gradient
  static const PRIMARY_COLOR_GRADIENT = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [START_COLOR, END_COLOR],
  );

  static const START_COLOR = Color(0xFF0FBD85);
  static const END_COLOR = Color(0xFF0BA5A8);

  static const GREY_COLOR_LIGHT = Color(0xFFF5F5F9);
}
