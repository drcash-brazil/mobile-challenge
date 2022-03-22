import 'package:get/get.dart';
import 'package:mobile_challenge/app/modules/login/login_binding.dart';
import 'package:mobile_challenge/app/modules/splash/splash_binding.dart';
import 'package:mobile_challenge/app/pages/home/home_page.dart';
import 'package:mobile_challenge/app/pages/login/login_page.dart';
import 'package:mobile_challenge/app/pages/splash/splash_page.dart';

class AppPages { 
  static final routes = [ 
    GetPage(name: '/', page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: '/auth/login', page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: '/home', page: () => HomePage())
  ]; 
}