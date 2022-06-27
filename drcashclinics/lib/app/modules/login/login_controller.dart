import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  bool obscureValue = true;

  @observable
  bool isLoading = false;

  @observable
  IconData obscureIcon = Icons.visibility_off;

  @action
  changeObscure() {
    obscureValue = !obscureValue;
    if (obscureValue) {
      obscureIcon = Icons.visibility_off;
    } else {
      obscureIcon = Icons.visibility;
    }
  }
}
