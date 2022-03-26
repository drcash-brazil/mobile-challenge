import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dr_cash_clinic/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DrCashClinic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.pages,
      initialRoute: '/splash',
    );
  }
}
