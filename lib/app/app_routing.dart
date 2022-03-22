import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppRouting {
  static final List<ModularRoute> routes = [
    ModuleRoute(
      AppRouteNamed.login._path!,
      module: LoginModule(),
    ),
    ModuleRoute(
      AppRouteNamed.home._path!,
      module: HomeModule(),
    )
  ];
}

enum AppRouteNamed { login, home, signUp, recoveryPassword }

extension AppRouteNamedExtension on AppRouteNamed {
  String? get _path {
    switch (this) {
      case AppRouteNamed.login:
        return '/login/';
      case AppRouteNamed.home:
        return '/home';
      default:
        return null;
    }
  }

  String? get fullPath => _path;
}
