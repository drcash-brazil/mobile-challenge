import 'package:drcashclinics/app/core/data/http/http.dart';
import 'package:drcashclinics/app/modules/login/login_controller.dart';
import 'package:drcashclinics/app/modules/login/login_model.dart';
import 'package:drcashclinics/app/modules/login/login_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return true if email and password is valid', () {
    final controller = LoginController(LoginRepositoryImp(HttpClientImp()));
    LoginModel loginModel =
        LoginModel(email: "teste@teste.com", password: "1234");
    expect(controller.isValidForm(loginModel), true);
  });

  test('Should return false if email and password is not valid', () {
    final controller = LoginController(LoginRepositoryImp(HttpClientImp()));
    LoginModel loginModel = LoginModel(email: "", password: "");
    expect(controller.isValidForm(loginModel), false);
  });
}
