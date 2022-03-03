import 'package:dr_cash_clinic/app/modules/clinics/repository/clinics_repository.dart';
import 'package:dr_cash_clinic/app/modules/home/home_page.dart';
import 'package:dr_cash_clinic/app/modules/login/login_screen_page.dart';
import 'package:dr_cash_clinic/app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClinicsRepository()),
    Bind.lazySingleton((i) => HomeModule())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const SplashPage(),
        transition: TransitionType.leftToRightWithFade),
    ChildRoute('/login', child: (context, args) => const LoginScreenPage()),
    ChildRoute('/home', child: (context, args) => const HomePage()),
    //ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
