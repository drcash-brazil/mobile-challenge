import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../api/api.dart';
import 'package:get/get.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;

  loginSnackBar({asset, text, color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          width: 50,
          height: 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Lottie.asset(asset,
                    repeat: false, alignment: Alignment.centerLeft),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 300,
        width: size.width * 0.80,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  return email!.isEmpty ? "Preencha o E-mail." : null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: isObscure,
                decoration: InputDecoration(
                  labelText: "Senha",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    }, 
                    icon: isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility), 
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (password) {
                  return password!.isEmpty ? "Preencha a Senha." : null;
                },
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      setState(() {
                        isLoading = true;
                      });

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }

                      await Api().Login(_emailController.text, _passwordController.text).then((value) {
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            isLoading = false;
                          });

                          loginSnackBar(
                            asset: value ? "assets/success.json" : "assets/failed.json",
                            text: value ? "Login realizado com sucesso !" : "Email/Senha estão incorretos.",
                            color: value ? Colors.green[300] : Colors.red[300],
                          );
                        }).whenComplete(() {
                          Future.delayed(const Duration(seconds: 3), () {
                            if(value) {
                              Get.toNamed('/home');
                            }
                          });
                        });
                      });
                    }
                  },
                  child: isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Entrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
