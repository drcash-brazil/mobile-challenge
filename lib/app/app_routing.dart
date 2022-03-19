import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';

class AppRouting {
  static final List<ModularRoute> routes = [
    ModuleRoute(
      AppRouteNamed.login._path!,
      module: LoginModule(),
    ),
  ];
}

enum AppRouteNamed { login, home, signUp, recoveryPassword }

extension AppRouteNamedExtension on AppRouteNamed {
  String? get _path {
    switch (this) {
      case AppRouteNamed.login:
        return '/login/';
      default:
        return null;
    }
  }

  String? get fullPath => _path;
}
