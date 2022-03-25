import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/app/core/themes/theme_ui.dart';
import 'package:mobile_challenge/app/core/widgets/challenge_appbar.dart';
import 'package:mobile_challenge/app/core/widgets/challenge_button.dart';
import 'package:mobile_challenge/app/core/widgets/challenge_textformfield.dart';
import 'package:mobile_challenge/app/modules/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChallengeAppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Acesse sua conta',
                          style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ChallengeTextformfield(
                          label: 'E-mail',
                          obscureText: false,
                          controllerr: _emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail obrigatório'),
                            Validatorless.email('E-mail inválido'),
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Obx(() {
                        
                          return ChallengeTextformfield(
                              label: 'Senha',
                              isPassword: true,
                              obscureText: controller.visibilityPassword.value,
                              controllerr: _passwordEC,
                              validator: Validatorless.multiple([
                                Validatorless.required('Senha obrigatório'),
                                Validatorless.min(6,
                                    'Senha deve conter pelo menos 6 caracteres'),
                              ]),
                            );
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: ChallengeButton(
                            width: double.infinity,
                            label: 'ENTRAR',
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                controller.login(
                                  email: _emailEC.text,
                                  password: _passwordEC.text,
                                );
                              }
                            },
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui uma conta?'),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Cadastre-se',
                                style: ThemeUI.textBold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
