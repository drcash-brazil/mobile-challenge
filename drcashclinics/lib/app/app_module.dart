import 'package:drcashclinics/app/modules/home/home_module.dart';
import 'package:drcashclinics/app/modules/login/login_module.dart';
import 'package:drcashclinics/app/modules/splash_screen/splash_screen_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashScreenModule()),
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/home/', module: HomeModule()),
  ];
}
