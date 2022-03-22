import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final void Function(String value) onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String label;
  final bool autofocus;
  final Icon icon;
  final bool enabled;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;

  TextInputWidget(
      {required this.onChanged,
      required this.keyboardType,
      required this.textInputAction,
      required this.enabled,
      required this.label,
      required this.isEmail,
      required this.icon,
      this.isPassword = false,
      this.autofocus = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: true,
      autofocus: autofocus,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      enabled: enabled,
      validator: (value) {
        // if (value!.isEmpty || value == null) {
        //   return 'This field is mandatory';
        // }
        // if (isEmail && !EmailValidator.validate(value)) {
        //   return 'This field has to be email.';
        // }
      },
      obscureText: isPassword,
      onChanged: onChanged,
      cursorColor: Color.fromARGB(255, 20, 105, 83),
      style: const TextStyle(color: Color.fromARGB(255, 20, 105, 83)),
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 20, 105, 83), width: 2)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          prefixIcon: icon,
          hintText: label,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 20, 105, 83))),
    );
  }
}
