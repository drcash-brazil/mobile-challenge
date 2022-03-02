//import 'package:ecomerce/screens/sign_up/sign_up_screen.dart';
import 'package:dr_cash_clinic/app/core/constants.dart';
import 'package:flutter/material.dart';

import '../core/size_config.dart';

class NoAccountTextPage extends StatelessWidget {
  const NoAccountTextPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          //onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          onTap: () {},
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
