import 'package:flutter/material.dart';
import 'package:dr_cash_clinic/pages/auth/auth_form.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(6, 197, 177, 1),
            Color.fromRGBO(6, 203, 171, 1),
            Color.fromRGBO(6, 213, 161, 1)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 100),
          reverse: true,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Image.asset("assets/logo.png"),
                ),
                SizedBox(
                  width: 300,
                  child: Lottie.asset("assets/doctor.json"),
                ),
                AuthForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
