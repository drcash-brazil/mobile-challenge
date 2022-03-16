import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/core/presenter/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppConstants.login,
      getPages: AppRoutes.pages,
    );
  }
}
