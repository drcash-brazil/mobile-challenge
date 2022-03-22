import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_challenge/app/core/bindings/application_binding.dart';
import 'package:mobile_challenge/app/routes/app_pages.dart';
import 'package:mobile_challenge/app/themes/theme_ui.dart';

void main() async {
  await GetStorage.init(); 
  runApp(const MobileChallengeApp());
}

class MobileChallengeApp extends StatelessWidget {
  const MobileChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dr Cash',
      theme: ThemeUI.theme, 
      initialBinding: ApplicationBinding(),
      getPages: AppPages.routes,
    );
  }
}



