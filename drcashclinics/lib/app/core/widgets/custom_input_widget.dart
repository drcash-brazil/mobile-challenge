// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String label;
  final bool obscure;
  final Widget? suffixIcon;
  final Widget? icon;
  TextInputType? keyboardType;
  final FocusNode? focus;
  final FocusNode? requestFocus;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;

  CustomInputWidget({
    Key? key,
    required this.label,
    this.obscure = false,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.icon,
    this.controller,
    this.onSubmitted,
    this.focus,
    this.requestFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 7,
            height: size.height * 0.095,
            child: TextFormField(
              keyboardType: keyboardType,
              obscureText: obscure,
              focusNode: focus,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: (term) async {
                if (requestFocus != null) {
                  FocusScope.of(context).requestFocus(requestFocus);
                }
                if (onSubmitted != null) {
                  onSubmitted!;
                }
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff06c9ad)),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: icon,
                ),
                border: UnderlineInputBorder(),
                labelText: label,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
