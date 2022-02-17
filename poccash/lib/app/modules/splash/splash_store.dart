import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poccash/app/shared/core/routes/app_routes.dart';
import 'package:poccash/app/shared/repositories/interfaces/i_storage_repository.dart';
import 'package:poccash/app/shared/settings/global_setting.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final IStorageRepository? storage;

  _SplashStoreBase(this.storage) {
    loading();
  }

  Future<void> loading() async {
    await Future.wait([
      storage!.loadVariables(),
      Future.delayed(
          const Duration(seconds: 2)) //para aparecer a tela de splash
    ]);

    var acessToken = GlobalSettings.globalInfoModel.accessToken;
    if (acessToken.isNotEmpty) {
      Modular.to.pushReplacementNamed(AppRoutes.home);
    } else {
      Modular.to.pushReplacementNamed(AppRoutes.auth);
    }
  }
}
