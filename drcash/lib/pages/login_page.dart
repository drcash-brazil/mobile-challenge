import 'package:drcash/blocs/auth/auth_cubit.dart';
import 'package:drcash/blocs/auth/auth_state.dart';
import 'package:drcash/core/routes.dart';
import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: _listener,
      child: Scaffold(
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
      ),
    );
  }

  _listener(context, state) {
    if (state is AuthLoadedState) {
      Navigator.pushReplacementNamed(context, Routes.home);
    } else if (state is AuthErrorState) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'Houve um problema com a sua requisição. Por favor, tente novamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget _getLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 200,
          ),
          const Spacer(flex: 7),
          TextFormField(
            decoration: _getTextFieldDecoration('Email'),
            onSaved: (String? value) => email = value ?? '',
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? null
                  : 'Email inválido';
            },
          ),
          const Spacer(flex: 2),
          TextFormField(
            obscureText: true,
            decoration: _getTextFieldDecoration('Password'),
            onSaved: (String? value) => password = value ?? '',
            validator: (String? value) {
              return (value == null || value == '')
                  ? 'Password inválido'
                  : null;
            },
          ),
          const Spacer(flex: 3),
          _getLoginButton()
        ],
      ),
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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const CircularProgressIndicator();
        }

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _login,
            style:
                ElevatedButton.styleFrom(primary: AppTheme.PRIMARY_COLOR_DARK),
            child: const Text('Login'),
          ),
        );
      },
    );
  }

  _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthCubit>().login(email, password);
    }
  }
}
