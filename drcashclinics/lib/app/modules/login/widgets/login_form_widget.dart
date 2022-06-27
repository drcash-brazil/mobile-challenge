import 'package:drcashclinics/app/core/widgets/custom_input_widget.dart';
import 'package:drcashclinics/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

final _formKey = GlobalKey<FormState>();

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Modular.get();

    final FocusNode emailFocus = FocusNode();
    final FocusNode passwordFocus = FocusNode();

    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * .9,
        height: MediaQuery.of(context).size.height * .4,
        child: Observer(builder: (_) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomInputWidget(
                  label: "Email",
                  icon: Icon(Icons.person),
                  keyboardType: TextInputType.emailAddress,
                  focus: emailFocus,
                  requestFocus: passwordFocus,
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "Preencha o campo email."
                        : null;
                  },
                  onChanged: (value) {},
                ),
                CustomInputWidget(
                    label: "Senha",
                    icon: Icon(Icons.lock),
                    obscure: controller.obscureValue,
                    keyboardType: TextInputType.text,
                    focus: passwordFocus,
                    onChanged: (value) {},
                    validator: (value) {
                      return value!.isEmpty ? "Preencha o campo senha." : null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () => controller.changeObscure(),
                      icon: Icon(controller.obscureIcon),
                    )),
                SizedBox(
                  height: 20,
                ),
                controller.isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff06c9ad),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text("Acessar"),
                      )
              ],
            ),
          );
        }),
      ),
    );
  }
}
