import 'package:drcashclinics/app/core/data/http/http.dart';
import 'package:drcashclinics/app/modules/home/home_controller.dart';
import 'package:drcashclinics/app/modules/home/home_page.dart';
import 'package:drcashclinics/app/modules/home/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => HomeController(HomeRepositoryImp(HttpClientImp())))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
