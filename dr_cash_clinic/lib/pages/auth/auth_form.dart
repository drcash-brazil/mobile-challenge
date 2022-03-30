import 'package:dr_cash_clinic/storage/storage.dart';
import 'package:dr_cash_clinic/api/api.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;
  bool isRemember = Storage.getRemember();

  @override
  void initState() {
    super.initState();
    loadCredentialsRemember();
  }
  
  loadCredentialsRemember() {
    if(isRemember) {
      _emailController.text = Storage.getEmailRemember();
      _passwordController.text = Storage.getPasswordRemember();
    }
  }

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
        height: 320,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Lembrar senha"),
                  Checkbox(
                    value: isRemember, 
                    onChanged: (status) {
                      setState(() {
                        isRemember = status!;
                      });
                      Storage.saveRemember(status);
                    } 
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      setState(() {
                        isLoading = true;
                      });

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      
                      Api().getToken(_emailController.text, _passwordController.text).then((value) {
                          setState(() {
                            isLoading = false;
                          });

                          loginSnackBar(
                            asset: value ? "assets/success.json" : "assets/failed.json",
                            text: value ? "Login realizado com sucesso !" : "Email/Senha estão incorretos.",
                            color: value ? Colors.green[300] : Colors.red[300],
                          );
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
