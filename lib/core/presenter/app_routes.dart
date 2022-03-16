import 'package:get/get.dart';
import 'package:mobile_challenge/modules/login/presenter/login_bindings.dart';
import 'package:mobile_challenge/modules/login/presenter/login_page.dart';

import '../../modules/home/presenter/home_bindings.dart';
import '../../modules/home/presenter/home_page.dart';

class AppRoutes {
  AppRoutes._();

  static final pages = [
    GetPage(
      name: AppConstants.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppConstants.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}

class AppConstants {
  AppConstants._();

  static const login = '/login';
  static const home = '/home';
}
