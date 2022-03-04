import 'package:dr_cash_clinic/app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Montserrat",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: const TextStyle(color: kTextColor),
    bodyText2: const TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: const Color(0xFd09efb1),
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: TextTheme(
      headline6: const TextStyle(color: Color(0xFd09efb1), fontSize: 18),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(color: Color(0xFd09efb1), fontSize: 18),
    ).headline6,
  );
}
