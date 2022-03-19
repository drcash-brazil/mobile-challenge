import 'package:flutter/material.dart';

class ThemeUI {
  ThemeUI._();

  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xFF007D21),
    primaryColorDark: const Color(0xFF00343F),
    fontFamily: 'mplus1',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF007D21),
        textStyle: const TextStyle(fontFamily: 'mplus1'),
      ),
    )
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}