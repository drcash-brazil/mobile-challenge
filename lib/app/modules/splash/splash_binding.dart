import 'package:get/get.dart';
import 'package:mobile_challenge/app/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
} 