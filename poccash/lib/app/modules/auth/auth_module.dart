import 'package:poccash/app/modules/auth/auth_page.dart';
import 'package:poccash/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poccash/app/shared/repositories/auth_repository.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) {
        return AuthRepository(i());
      },
    ),
    Bind.lazySingleton(
      (i) {
        return AuthStore(
          i(),
          i(),
        );
      },
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
  ];
}
