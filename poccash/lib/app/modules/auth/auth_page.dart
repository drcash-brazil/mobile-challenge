import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poccash/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:poccash/app/shared/core/color/app_colors.dart';
import 'package:poccash/app/shared/enums/request_state_enum.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  AuthPageState();
  final AuthStore store = Modular.get();

  final _loginController = TextEditingController();

  final _passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (store.authState == RequestStateEnum.loading) {
              return Column(
                children: [
                  const SizedBox(height: 90.0),
                  Image.asset(
                    'assets/img/splash.png',
                    height: 120,
                    width: 275,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Dr Cash",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Center(
                      child: CircularProgressIndicator(
                    color: Color(AppColors.strColorPrimary),
                  )),
                ],
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                const SizedBox(height: 90.0),
                Column(
                  children: [
                    Image.asset(
                      'assets/img/splash.png',
                      height: 120,
                      width: 275,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Dr Cash",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                        color: AppColors.colorPrimary,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40.0),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  margin: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: TextField(
                      controller: _loginController,
                      decoration: const InputDecoration(
                        labelText: 'E-MAIL',
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(112, 112, 112, 1),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(112, 112, 112, 0.3),
                      ),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Color.fromRGBO(112, 112, 112, 1)),
                      onChanged: (value) => store.setUserName(value),
                      textInputAction: TextInputAction.next),
                ),
                const SizedBox(height: 12.0),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  margin: const EdgeInsets.only(right: 23, left: 23),
                  child: TextField(
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: 'SENHA',
                      labelStyle: const TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(112, 112, 112, 0.3),
                      suffixIcon: IconButton(
                        icon: Icon(
                          store.obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(AppColors.strColorPrimary),
                        ),
                        onPressed: () {
                          store.visibilityPassword();
                        },
                      ),
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Color.fromRGBO(112, 112, 112, 1)),
                    obscureText: store.obscureText,
                    onChanged: (value) => store.setPass(value),
                  ),
                ),
                const SizedBox(height: 6.0),
                Container(
                  margin: const EdgeInsets.only(right: 23, left: 23),
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(AppColors.strColorPrimary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('ENTRAR',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              color: Colors.white)),
                      onPressed: store.login),
                ),
                const SizedBox(height: 40.0),
                Text(
                  "1.0.0",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.0,
                    color: Color(AppColors.strColorPrimary),
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
