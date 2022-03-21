import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import '../../../../core/params/credential_params.dart';
import '../../../clinics/presentation/pages/home_page.dart';
import '../../external/datasource/drcash_authentication.dart';
import '../widgets/button_custom_widget.dart';
import '../widgets/logo_app_widget.dart';
import '../widgets/snackbar_message.dart';
import '../widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: _isLoading,
          progressIndicator: LoadingAnimationWidget.hexagonDots(
            color: Colors.white,
            size: 50,
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    "https://www.drcash.com.br/img/Home/banners4.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100.0),
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Center(
                            child: LogoApp(
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                          TextFieldWidget(
                            validation: (email) {
                              if (_emailController.text.isEmpty) {
                                return "E-mail inválido";
                              }
                              if (!isEmail(_emailController.text)) {
                                return "E-mail inválido";
                              }
                              return null;
                            },
                            controller: _emailController,
                            labelText: 'Insira seu e-mail ou CPF',
                            keyboadType: TextInputType.emailAddress,
                            labelColor: Colors.white,
                            textColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 32.0,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Esqueceu sua senha?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextFieldWidget(
                            validation: (email) {
                              if (_passwordController.text.isEmpty) {
                                return "Senha inválida";
                              }
                              return null;
                            },
                            labelText: 'Palavra-passe',
                            obscureText: true,
                            controller: _passwordController,
                            labelColor: Colors.white,
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          ButtonCustom(
                            fontSize: 12,
                            text: 'Avançar',
                            onPressed: () async {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });

                                context
                                    .read<DrCashRemoteAuthDataSource>()
                                    .authenticate(
                                      CredentialsParams(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    )
                                    .then((isAuthenticated) {
                                  setState(() {
                                    _isLoading = false;
                                  });

                                  if (!isAuthenticated) {
                                    showSnackBarMessar(
                                        message: context
                                            .read<DrCashRemoteAuthDataSource>()
                                            .errorMessage,
                                        context: context);
                                    return;
                                  }
                                  showSnackBarMessar(
                                      message: "Login realizado com sucesso",
                                      color: Color(0xFF00C853),
                                      context: context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) {
                                      return HomePage();
                                    }),
                                  );
                                });
                              }
                            },
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1.0,
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'Ou',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1.0,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ButtonCustom(
                            elevation: 0,
                            fontSize: 12,
                            text: 'Criar uma conta',
                            onPressed: () async {},
                            textColor: Colors.white,
                            backgroundColor: Color(0xFF00BF9C),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: const [
                      Text(
                        'Powered by DrCash',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
