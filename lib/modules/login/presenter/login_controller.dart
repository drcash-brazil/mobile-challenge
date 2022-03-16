import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/core/presenter/app_routes.dart';
import 'package:mobile_challenge/modules/login/domain/exception/login_exception.dart';

import '../domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUsecase _loginUsecase;
  LoginController(this._loginUsecase);

  final emailEC = TextEditingController(text: 'lucas@gmail.com');
  final passwordEC = TextEditingController(text: 'drcashclinics123!#');

  Future login() async {
    try {
      final canLogin = await _loginUsecase(
        emailEC.text,
        passwordEC.text,
      );
      if (canLogin) {
        Get.offAllNamed(AppConstants.home);
      }
    } on LoginException {
      Get.snackbar('Erro ao logar-se', '');
    }
  }
}
