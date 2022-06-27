import 'package:drcashclinics/app/core/data/http/http.dart';
import 'package:drcashclinics/app/modules/login/login_controller.dart';
import 'package:drcashclinics/app/modules/login/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => LoginController(
        LoginRepositoryImp(
          HttpClientImp(),
        ),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];
}
