import 'package:drcash/core/routes.dart';
import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:
            const BoxDecoration(gradient: AppTheme.PRIMARY_COLOR_GRADIENT),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 24,
            height: 380,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: _getLoginForm(),
          ),
        ),
      ),
    );
  }

  Widget _getLoginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          width: 200,
        ),
        const Spacer(flex: 7),
        TextField(decoration: _getTextFieldDecoration('Email')),
        const Spacer(flex: 2),
        TextField(
          obscureText: true,
          decoration: _getTextFieldDecoration('Password'),
        ),
        const Spacer(flex: 3),
        _getLoginButton()
      ],
    );
  }

  InputDecoration _getTextFieldDecoration(String labelText) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.PRIMARY_COLOR_DARK,
        ),
      ),
      floatingLabelStyle: const TextStyle(color: AppTheme.PRIMARY_COLOR_DARK),
      labelText: labelText,
    );
  }

  Widget _getLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.home);
        },
        style: ElevatedButton.styleFrom(
          primary: AppTheme.PRIMARY_COLOR_DARK,
        ),
        child: const Text('Login'),
      ),
    );
  }
}
