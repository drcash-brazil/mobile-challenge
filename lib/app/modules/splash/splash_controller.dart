import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_challenge/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 2), () {
      Get.putAsync(() => AuthService().init());
    });
    super.onInit();
  }
}