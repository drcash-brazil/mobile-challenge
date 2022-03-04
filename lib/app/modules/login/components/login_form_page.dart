// ignore_for_file: unrelated_type_equality_checks

import 'package:dr_cash_clinic/app/helper/keyboard.dart';
import 'package:dr_cash_clinic/app/modules/login/components/alert_page.dart';
import 'package:dr_cash_clinic/app/modules/login/repository/login_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../core/constants.dart';
import '../../../core/size_config.dart';

class LoginFormPage extends StatefulWidget {
  final String title;
  const LoginFormPage({Key? key, this.title = 'Login'}) : super(key: key);
  @override
  LoginFormPageState createState() => LoginFormPageState();
}

class LoginFormPageState extends State<LoginFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late String email;
  late String password;
  bool? remember = false;

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                // onTap: () => Navigator.pushNamed(
                //     context, ForgotPasswordScreen.routeName),
                onTap: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Entrar",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                email = _emailController.text;
                print('email controller: $email');

                password = _passwordController.text;
                print('password controller: $password');

                var user = await LoginAuthRepository().login(email, password);

                //await user.login(email, password);
                if (user != true) {
                  print('user form: $user');
                  KeyboardUtil.hideKeyboard(context);
                  Modular.to.navigate('/home');
                  //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                } else if (user == false) {
                  {
                    alert(context, "Login Inválido!");
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        // enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: kPrimaryColor),),
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
