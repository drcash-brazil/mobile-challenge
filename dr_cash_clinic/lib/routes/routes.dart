import 'package:dr_cash_clinic/pages/auth/login.dart';
import 'package:dr_cash_clinic/pages/splash.dart';
import 'package:dr_cash_clinic/pages/home.dart';
import 'package:get/get.dart';

class Routes {
  static final pages = [
    GetPage(name: '/', page: () => Login(), transition: Transition.downToUp),
    GetPage(name: '/home', page: () => Home(), transition: Transition.downToUp),
    GetPage(name: '/splash', page: () => Splash()),
  ];
}
