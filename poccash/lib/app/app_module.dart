import 'package:flutter_modular/flutter_modular.dart';
import 'package:poccash/app/modules/auth/auth_module.dart';
import 'package:poccash/app/modules/home/home_module.dart';
import 'package:poccash/app/modules/splash/splash_module.dart';
import 'package:poccash/app/shared/core/routes/app_routes.dart';
import 'package:poccash/app/shared/repositories/storage_repository.dart';
import 'package:poccash/app/shared/webclient/webclient.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WebClient()),
    Bind.lazySingleton((i) => StorageRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute(AppRoutes.auth, module: AuthModule()),
    ModuleRoute(AppRoutes.home, module: HomeModule()),
  ];
}
