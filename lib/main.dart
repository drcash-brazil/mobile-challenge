import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/app/bindings/application_bindings.dart';
import 'package:mobile_challenge/app/pages/login/login_page.dart';
import 'package:mobile_challenge/app/themes/theme_ui.dart';

void main() {
  runApp(const MobileChallengeApp());
}

class MobileChallengeApp extends StatelessWidget {
  const MobileChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dr Cash',
      theme: ThemeUI.theme,
      //initialBinding: ApplicationBindings(),
      getPages: [
        GetPage(name: '/', page: () => LoginPage())
      ],
    );
  }
}



