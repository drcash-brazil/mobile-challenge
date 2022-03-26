import 'package:get/get.dart';
import '../pages/auth/login.dart';

class Routes {
  static final pages = [
    GetPage(name: '/', page: () => Login(), transition: Transition.downToUp),
  ];
}
