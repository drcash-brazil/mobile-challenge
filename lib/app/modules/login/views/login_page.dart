import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../stores/login_store.dart';
import '../../../app_routing.dart';
import '../../util/colors/colors.dart';

import '../../util/loading_page/loading_page_widget.dart';
import '../../util/widgets/text_field_with_validation_widget.dart';
import 'widgets/buttons_login_our_register.dart';
import 'widgets/logo_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.sucess = false}) : super(key: key);

  final bool sucess;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore>
    with SingleTickerProviderStateMixin {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    store.loginController.appStore
        .getSharedPref(stringValue: 'userValue')
        .then((value) {
      store.setLogin(value);
      loginController.text = value;
    });
    store.loginController.appStore
        .getSharedPref(stringValue: 'passwordValue')
        .then((value) {
      store.setPassword(value);
      senhaController.text = value;
    });
    if (widget.sucess) {
      store.startTimer(context);
    }
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: ColorsConstants.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const LogoWidget(),
                  Container(
                    height: MediaQuery.of(context).size.height * .6,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 62),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .065,
                              right: MediaQuery.of(context).size.width * .065,
                              bottom: MediaQuery.of(context).size.height * .065,
                            ),
                            child: Observer(
                              builder: (_) {
                                return TextFieldWithValidationWidget(
                                  controller: loginController,
                                  focusNode: store.focusLogin,
                                  placeholder: FlutterI18n.translate(
                                      context, 'telaLogin.usuario'),
                                  onChanged: (newLogin) {
                                    store.setLogin(newLogin);
                                    store.loginValidate(context);
                                  },
                                  textInputAction: TextInputAction.next,
                                  messageError: store.messageLoginError,
                                  onValidator: () =>
                                      store.loginValidate(context),
                                  onEditingComplete: () =>
                                      FocusScope.of(context)
                                          .requestFocus(store.focusPassword),
                                );
                              },
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .065,
                            right: MediaQuery.of(context).size.width * .065,
                            bottom: MediaQuery.of(context).size.height * .065,
                          ),
                          child: Column(
                            children: [
                              Observer(
                                builder: (_) {
                                  return TextFieldWithValidationWidget(
                                    controller: senhaController,
                                    focusNode: store.focusPassword,
                                    placeholder: FlutterI18n.translate(
                                        context, 'telaLogin.senha'),
                                    onChanged: (newPassword) {
                                      store.setPassword(newPassword);
                                      store.passwordValidate(context);
                                    },
                                    textInputAction: TextInputAction.done,
                                    messageError: store.messagePasswordError,
                                    onValidator: () =>
                                        store.passwordValidate(context),
                                    onEditingComplete: () =>
                                        FocusScope.of(context).nextFocus(),
                                    isPassword: true,
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                  ),
                                  child: GestureDetector(
                                    child: Text(
                                      FlutterI18n.translate(context,
                                          'telaLogin.esqueceuSuaSenha'),
                                      style: const TextStyle(
                                        color: ColorsConstants.primary,
                                      ),
                                    ),
                                    onTap: () => store.loginController.appStore
                                        .checkConnectivityPushNamed(
                                      context: context,
                                      rout: AppRouteNamed
                                          .recoveryPassword.fullPath!,
                                      isReplacement: false,
                                      title: FlutterI18n.translate(
                                          context, 'global.aviso'),
                                      text: FlutterI18n.translate(context,
                                          'telaLogin.esqueceuSenhaSemConexao'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ButtonsLoginOurRegister(
                          onTapLogin: () => store.autenticate(
                            context,
                            FlutterI18n.translate(context, 'global.aviso'),
                            FlutterI18n.translate(
                                context, 'telaLogin.entrarSemConexao'),
                          ),
                          onTapRegister: () => store.loginController.appStore
                              .checkConnectivityPushNamed(
                            context: context,
                            rout: AppRouteNamed.signUp.fullPath!,
                            isReplacement: false,
                            title:
                                FlutterI18n.translate(context, 'global.aviso'),
                            text: FlutterI18n.translate(
                                context, 'telaLogin.cadastrarSemConexao'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Observer(
          builder: (_) {
            return store.isLoading
                ? LoadingPageWidget(
                    store: store,
                  )
                : const SizedBox();
          },
        )
      ],
    );
  }
}
