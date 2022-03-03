import 'package:flutter/material.dart';

import '../../../components/no_account_text_page.dart';
import '../../../components/social_card_page.dart';
import '../../../core/size_config.dart';
import 'login_form_page.dart';

class BodyPage extends StatefulWidget {
  final String title;
  const BodyPage({Key? key, this.title = 'BodyPageDart'}) : super(key: key);
  @override
  BodyPageState createState() => BodyPageState();
}

class BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Seja Bem vindo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Insira seu email e senha \ou conecte-se utilizando uma rede social",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const LoginFormPage(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCardPage(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialCardPage(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialCardPage(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                const NoAccountTextPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
