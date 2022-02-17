import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:poccash/app/modules/splash/splash_module.dart';
import 'package:poccash/app/shared/repositories/storage_repository.dart';

main() {
  final dioMock = StorageRepository();
  initModule(SplashModule(), replaceBinds: [
    Bind.instance<StorageRepository>(dioMock),
  ]);
}
