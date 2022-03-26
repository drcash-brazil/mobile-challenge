import 'package:get/get.dart';
import '../pages/auth/login.dart';
import '../pages/splash.dart';

class Routes {
  static final pages = [
    GetPage(
        name: '/', page: () => Login(), transition: Transition.circularReveal),
    GetPage(name: '/splash', page: () => Splash()),
  ];
}