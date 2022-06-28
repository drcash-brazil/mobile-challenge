import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../pages/signin.text.dart';

class InputLogin extends StatelessWidget {
  final TextEditingController controller;

  const InputLogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: Text(
              SigninText.login,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            )),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          controller: controller,
          validator: MultiValidator([
            EmailValidator(errorText: 'Por favor, insira um e-mail válido'),
            RequiredValidator(errorText: 'Por favor, insira um e-mail'),
          ]),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: SigninText.hintTextLogin,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
