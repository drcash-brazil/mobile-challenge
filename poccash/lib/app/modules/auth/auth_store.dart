import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poccash/app/shared/core/routes/app_routes.dart';
import 'package:poccash/app/shared/core/toastMsg/toast_msg.dart';
import 'package:poccash/app/shared/enums/request_state_enum.dart';
import 'package:poccash/app/shared/repositories/interfaces/i_auth_repository.dart';
import 'package:poccash/app/shared/repositories/interfaces/i_storage_repository.dart';
import 'package:poccash/app/shared/settings/global_setting.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthRepository? authRespository;
  final IStorageRepository? storage;

  _AuthStoreBase(
    this.authRespository,
    this.storage,
  );

  @observable
  RequestStateEnum authState = RequestStateEnum.idle;
  @observable
  String userName = "";
  @observable
  String password = "";
  @observable
  bool obscureText = true;

  @action
  void setUserName(String value) {
    userName = value;
  }

  @action
  void setPass(String value) {
    password = value;
  }

  @action
  void visibilityPassword() {
    obscureText = !obscureText;
  }

  @action
  Future<void> login() async {
    try {
      if (userName.isEmpty || password.isEmpty) {
        ToastMsg.show("Usuário e/ou senha inválido(s)");
        return;
      }
      authState = RequestStateEnum.loading;
      var auth = await authRespository!.login(userName, password);
      if (auth.accessToken!.isNotEmpty) {
        GlobalSettings.globalInfoModel.accessToken = auth.accessToken ?? "";
        GlobalSettings.globalInfoModel.refreshToken = auth.refreshToken ?? "";

        await storage!.saveStorage();
        await Modular.to.pushReplacementNamed(AppRoutes.home);
      } else if (auth.errors != null && auth.errors!.isNotEmpty) {
        var msgErro = "";
        for (var item in auth.errors!) {
          msgErro += item;
        }
        ToastMsg.show(msgErro);
      }
      authState = RequestStateEnum.success;
    } catch (e) {
      ToastMsg.show("Problemas ao logar, tente novamente");
    }
    authState = RequestStateEnum.idle;
  }
}
