import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:mobile_challenge/app/core/themes/theme_ui.dart';
import 'package:mobile_challenge/app/modules/login/login_controller.dart';

class ChallengeTextformfield extends GetView<LoginController> {
  final String label;
  final TextEditingController? controllerr;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final bool? isPassword;

  const ChallengeTextformfield(
      {Key? key,
      required this.label,
      this.controllerr,
      this.validator,
      this.onChange,
      this.obscureText,
      this.isPassword
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerr,
      obscureText: isPassword == null ? false :  controller.visibilityPassword.value,
      validator: validator,
      onChanged: onChange,
      cursorColor: context.theme.primaryColor,
      decoration: InputDecoration(
        suffixIcon: isPassword != null
            ? IconButton(
                icon: Icon(
                  controller.visibilityPassword.value == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: ThemeUI.primaryColor,
                ),
                onPressed: () {
                  controller.visibilityPassword.value =
                      !controller.visibilityPassword.value;
                },
              )
            : null,
        isDense: true,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        errorStyle: const TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
