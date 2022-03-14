import 'package:flutter/material.dart';

class DefaultTheme {
  ThemeData get theme {
    return ThemeData(
      fontFamily: 'FredokaOne',
      scaffoldBackgroundColor: const Color(0xFFf2f2f2),
      backgroundColor: const Color(0xFF2196f3),
      primaryColor: const Color(0xFF54F7B3),
      secondaryHeaderColor: const Color(0xFF00529E),
      primaryColorLight: Colors.white,
      brightness: Brightness.light,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 30,
        ),
        headline2: TextStyle(
          fontSize: 24,
        ),
        headline3: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        headline4: TextStyle(
          fontSize: 14,
        ),
        headline5: TextStyle(
          fontSize: 12,
        ),
        headline6: TextStyle(
          fontSize: 10,
        ),
        bodyText1: TextStyle(
          fontSize: 12,
          letterSpacing: 1,
        ),
        button: TextStyle(
          fontSize: 18,
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        color: Color(0xFF54F7B3),
      ),
      errorColor: Colors.red[400],
      canvasColor: Colors.white,
      cardColor: const Color(0xFFe5e5e5),
      dividerColor: const Color(0xFF2196f3),
      hintColor: Colors.black,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.black),
    );
  }
}
