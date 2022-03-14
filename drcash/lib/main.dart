import 'package:drcash/view/auth/auth_view.dart';
import 'package:drcash/view/auth/splash.dart';
import 'package:drcash/view/home_view.dart';
import 'package:flutter/material.dart';

import 'theme/theme.dart';

Future<void> main() async {
  runApp(const DrCash());
}

class DrCash extends StatelessWidget {
  const DrCash({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'drcash',
      theme: DefaultTheme().theme,
      home: const SplashView(),
      routes: {
        '/home': (context) => const HomeView(),
        '/login': (context) => const AuthView(),
      },
    );
  }
}
