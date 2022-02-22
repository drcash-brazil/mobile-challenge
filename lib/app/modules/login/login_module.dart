import 'package:dr_cash_clinic/app/modules/login/repositories_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RepositoriesRepository()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
