import 'package:drcashclinics/app/modules/login/login_model.dart';
import 'package:drcashclinics/app/modules/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:motion_toast/motion_toast.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginRepository repository;
  LoginControllerBase(this.repository);

  @observable
  LoginModel loginModel = LoginModel();

  final FocusNode emailFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  @observable
  bool obscureValue = true;

  @observable
  bool isLoading = false;

  @observable
  IconData obscureIcon = Icons.visibility_off;

  @action
  bool isValidForm(LoginModel loginModel) {
    return (loginModel.email != null && loginModel.email != "") &&
        (loginModel.password != null && loginModel.password != "");
  }

  @action
  changeIsLoading() => isLoading = !isLoading;

  login(BuildContext context) async {
    changeIsLoading();
    if (isValidForm(loginModel)) {
      dynamic result = await repository.login(loginModel: loginModel);
      if (result["statusCode"] == 200) {
        Modular.to.navigate('/home/');
      } else {
        // ignore: use_build_context_synchronously
        MotionToast(
          icon: Icons.close,
          primaryColor: Colors.red,
          description: Text(result["body"]["errors"][0]),
          width: 300,
        ).show(context);
      }
      changeIsLoading();
      return result;
    }
  }

  logout() async {
    Modular.to.navigate('/login/');
  }

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
