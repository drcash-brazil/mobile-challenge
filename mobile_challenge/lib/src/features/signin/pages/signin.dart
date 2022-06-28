import 'package:flutter/material.dart';
import 'package:mobile_challenge/src/core/constants/routes.dart';
import 'package:mobile_challenge/src/core/services/signin/signin_service.dart';
import 'package:mobile_challenge/src/core/util/assets.dart';
import 'package:mobile_challenge/src/features/signin/pages/signin.text.dart';
import 'package:mobile_challenge/src/features/signin/widgets/input_login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/util/base_colors.dart';
import '../widgets/message_error.dart';
import '../widgets/message_success.dart';
import '../widgets/new_account.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final SigninDTO _signinDTO = SigninDTO();
  bool obscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: BaseColors.drCashPrimary,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: SizedBox(
                width: 330.0,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 140.0,
                    ),
                    Image.asset(AppAssets.logoColor),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          SigninText.welcomeTitle,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),
                        )),
                    const SizedBox(
                      height: 40.0,
                    ),
                    InputLogin(controller: _emailController),
                    const SizedBox(
                      height: 32.0,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          SigninText.password,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (_passwordController.text.isEmpty) {
                          return SigninText.passwordIncomplete;
                        }
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: const Icon(Icons.visibility),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      obscureText: obscure,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(SigninText.pageDeveloper)));
                        },
                        child: const Text(
                          SigninText.rememberPass,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    SizedBox(
                      width: 330.0,
                      height: 40.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: BaseColors.drCashPrimary,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate() || isLoading) {
                            setState(() {
                              isLoading = true;
                            });
                            _signinDTO
                                .signin(_emailController.text,
                                    _passwordController.text)
                                .then((value) {
                              Navigator.pushNamed(context, AppRouteNames.home,
                                  arguments: value);
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  content: MessageSuccess(
                                    text: SigninText.loginSuccess,
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }).catchError((error) {
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  content: MessageError(
                                    text: SigninText.loginError,
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            });
                          }
                        },
                        child: const Text(
                          SigninText.continueButton,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const NewAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
