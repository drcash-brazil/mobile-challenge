import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/login_controller.dart';
import 'interfaces/login_repository_interface.dart';
import 'login_routing.dart';
import 'repositories/login_repository.dart';
import 'stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<ILoginRepository>((i) => LoginRepository(Modular.get())),
    Bind.singleton((i) => LoginController(i.get(), i.get())),
    Bind.lazySingleton(
      (i) => LoginStore(loginController: i.get()),
    ),
  ];

  @override
  List<ModularRoute> get routes => LoginRouting.routes;
}
