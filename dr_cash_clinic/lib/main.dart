import 'package:shared_preferences/shared_preferences.dart';
import 'package:dr_cash_clinic/storage/storage.dart';
import 'package:dr_cash_clinic/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  loadStorage() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    Storage.setInstance(storage);
  }
  
  @override
  Widget build(BuildContext context) {

    loadStorage();
    return GetMaterialApp(
      title: 'DrCashClinic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromRGBO(6, 203, 171, 1),
      ),
      getPages: Routes.pages,
      initialRoute: '/splash',
    );
  }
}
