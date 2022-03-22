import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/clinics/clinics_controller.dart';
import 'home_routing.dart';
import 'repositories/clinics/clinics_repository.dart';
import 'stores/clinics_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ClinicsRepository(i.get())),
    Bind((i) => ClinicsController(i.get(), i.get())),
    Bind((i) => ClinicsStore(clinicsController: i.get())),
  ];

  @override
  List<ModularRoute> get routes => HomeRouting.routes;
}
