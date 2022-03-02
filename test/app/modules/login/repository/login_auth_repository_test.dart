import 'package:flutter_test/flutter_test.dart';
import 'package:dr_cash_clinic/app/modules/login/repository/login_auth_repository.dart';
 
void main() {
  late LoginAuthRepository repository;

  setUpAll(() {
    repository = LoginAuthRepository();
  });
}