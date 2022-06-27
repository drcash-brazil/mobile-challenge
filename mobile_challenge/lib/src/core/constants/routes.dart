import 'package:flutter/material.dart';
import 'package:mobile_challenge/src/features/home/page/home.dart';

import '../../features/greetings/page/greetings_page.dart';
import '../../features/signin/pages/signin.dart';

class AppRouteNames {
  static const String greetings = '/greetings';
  static const String signin = '/signin';
  static const String home = '/home';
}

class AppRoutes {
  static final Map<String, Widget Function(Object? args)> routes = {
    AppRouteNames.greetings: (_) => GreetingsPage(),
    AppRouteNames.signin: (_) => SigninPage(),
    AppRouteNames.home: (_) => HomePage(),
  };
}
