import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_challenge_drcash/pages/login/bloc/login_bloc.dart';
import 'package:mobile_challenge_drcash/pages/login/bloc/login_event.dart';
import 'package:mobile_challenge_drcash/pages/login/bloc/login_state.dart';
import 'package:mobile_challenge_drcash/widgets/text_input_widget.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailFieldController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController passwordFieldController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    return const Color.fromARGB(255, 20, 105, 83);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06D6A0),
      body: SingleChildScrollView(
        child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
          switch (state.runtimeType) {
            case ErrorState:
              ErrorState errorState = state as ErrorState;
              Fluttertoast.showToast(
                  msg: errorState.errorMessage ?? "Error",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.grey[900],
                  textColor: Colors.white,
                  fontSize: 16.0);
              break;
            case SuccessState:
              SuccessState successState = state as SuccessState;
              Fluttertoast.showToast(
                  msg: successState.successMessage ?? "Success",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.grey[900],
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.pushReplacementNamed(context, '/home');
              break;
            default:
          }
        }, builder: (context, state) {
          switch (state.runtimeType) {
            case ErrorState:
            case SuccessState:
            case LoadingState:
            case LoginState:
              emailFieldController.text = state.email ?? "";
              passwordFieldController.text = state.password ?? "";
              return Padding(
                padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/dr-cash-logo.png',
                            width: 150,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextInputWidget(
                            label: 'E-mail',
                            isEmail: true,
                            keyboardType: TextInputType.emailAddress,
                            enabled: state is! LoadingState,
                            onChanged: (value) => {
                              context
                                  .read<LoginBloc>()
                                  .add(UpdateEmailEvent(email: value))
                            },
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            controller: emailFieldController,
                            icon: const Icon(Icons.person,
                                color: Color.fromARGB(255, 20, 105, 83)),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextInputWidget(
                            isEmail: false,
                            label: 'Password',
                            isPassword: true,
                            keyboardType: TextInputType.text,
                            enabled: state is! LoadingState,
                            onChanged: (value) => {
                              context
                                  .read<LoginBloc>()
                                  .add(UpdatePasswordEvent(password: value))
                            },
                            autofocus: false,
                            textInputAction: TextInputAction.done,
                            controller: passwordFieldController,
                            icon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 20, 105, 83),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: state.saveData,
                                onChanged: (bool? value) {
                                  context
                                      .read<LoginBloc>()
                                      .add(UpdateSaveDataEvent(save: value!));
                                },
                              ),
                              Text(
                                "Save Email and Password?",
                                style: GoogleFonts.roboto(
                                    color: Color.fromARGB(255, 20, 105, 83),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          side: const BorderSide(
                                              color: Colors.transparent))),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.symmetric(
                                              vertical: 19, horizontal: 82)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blueAccent)),
                              onPressed: () => {
                                if (loginFormKey.currentState!.validate())
                                  {
                                    context
                                        .read<LoginBloc>()
                                        .add(SubmitLoginEvent())
                                  }
                              },
                              child: state is LoadingState
                                  ? const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Colors.lightBlue,
                                          )))
                                  : Text(
                                      'Login',
                                      style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
