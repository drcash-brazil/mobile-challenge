import 'package:drcash/pages/home_page.dart';
import 'package:drcash/pages/login_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String details = '/details';

  static final routes = <String, WidgetBuilder>{
    login: (context) => const LoginPage(),
    home: (context) => const HomePage(),
  };
}
