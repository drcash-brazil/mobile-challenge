import 'package:drcash/service/auth_service.dart';
import 'package:drcash/view/auth/auth_view.dart';
import 'package:drcash/view/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: AuthService().tokenValido().asStream(),
        builder: ((context, snapshot) {
          return snapshot.data == false ? const AuthView() : const HomeView();
        }));
  }
}
