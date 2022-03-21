import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarMessar(
    {String message, BuildContext context, Color color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      action: SnackBarAction(
          label: "OK",
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }),
      content: Text(
        message ?? "Erro ao autenticar",
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      backgroundColor: color ?? Colors.red,
    ),
  );
}
