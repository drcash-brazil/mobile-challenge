import 'package:dr_cash_clinic/app/core/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF06D6A0);
const kPrimaryLightColor = Color(0xFd09efb1);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF06D6A0), Color(0xFd09efb1)],
);
const kSecondaryColor = Color(0xffffffff);
const kTextColor = Color(0xFF000000);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor, entre com seu Email";
const String kInvalidEmailError = "Email inválido";
const String kPassNullError = "Insira sua Senha";
const String kShortPassError = "Senha incorreta ou menor";
const String kMatchPassError = "Senha não encontrada";
const String kNamelNullError = "Informe seu nome";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
