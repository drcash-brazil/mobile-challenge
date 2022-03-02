import 'package:dr_cash_clinic/app/modules/login/repository/login_auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginAuthRepository()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
