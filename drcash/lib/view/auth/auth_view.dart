import 'package:drcash/model/usuario.dart';
import 'package:drcash/service/auth_service.dart';
import 'package:drcash/view/auth/splash.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  final String mensagem;
  const AuthView({Key key, this.mensagem}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordObscured = false;
  final authService = AuthService();

  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: form(context),
    );
  }

  Widget form(context) {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/dr-cash.jpg",
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5, color: Theme.of(context).backgroundColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5, color: Theme.of(context).backgroundColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5, color: Theme.of(context).backgroundColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Email",
                    hintStyle: Theme.of(context).textTheme.headline5.copyWith(
                          color: Theme.of(context).backgroundColor,
                        ),
                  ),
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Theme.of(context).backgroundColor,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: passwordObscured,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5, color: Theme.of(context).backgroundColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5, color: Theme.of(context).backgroundColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5, color: Theme.of(context).backgroundColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordObscured = !passwordObscured;
                          });
                        },
                        icon: Icon(passwordObscured == true
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    hintText: "*****",
                    hintStyle: Theme.of(context).textTheme.headline5.copyWith(
                          color: Theme.of(context).backgroundColor,
                        ),
                  ),
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Theme.of(context).backgroundColor,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                mensagem,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Theme.of(context).errorColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 120,
                height: 40,
                color: Theme.of(context).primaryColorLight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: (() {
                    var email = emailController.text.trim();
                    var password = passwordController.text.trim();

                    var usuario = Usuario(email: email, password: password);

                    authService.login(usuario).then((_usuario) {
                      print(_usuario.acecessToken);
                      authService.salvarToken(_usuario);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashView()),
                      );
                    }).catchError((onError) {
                      setState(() {
                        mensagem = 'E-mail ou senha estão incorretos';
                      });
                    });
                  }),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
