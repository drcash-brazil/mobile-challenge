import 'package:drcashclinics/app/modules/home/home_module.dart';
import 'package:drcashclinics/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home/', module: HomeModule()),
  ];
}
