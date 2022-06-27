import 'package:drcashclinics/app/modules/login/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: size.height * .65,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff06c9ad),
                    Color(0xff06bcba),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: isKeyboard ? size.height * .1 : size.height * .3,
                  ),
                  Image.asset("assets/images/logo_drCash.png"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cuide agora, pague depois!",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * .35,
              color: Colors.white,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: isKeyboard ? size.height * .2 : size.height * .45,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: LoginForm(),
          ),
        )
      ],
    );
  }
}
