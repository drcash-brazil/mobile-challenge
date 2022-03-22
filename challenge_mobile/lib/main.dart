import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'app/features/authentication/data/datasources/remote_authentication_datasource.dart';
import 'app/features/authentication/external/datasource/drcash_authentication.dart';
import 'app/features/authentication/presentation/pages/login_page.dart';
import 'app/features/home/external/dr_cash_get_remote_clinics.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  return runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  RemoteAuthenticationDataSource remoteAuthenticationDataSource;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DrCashRemoteAuthDataSource(Dio())),
        ChangeNotifierProvider(create: (_) => DrCashGetRemoteClinics(Dio()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Color(0xFF06caad),
          textTheme: TextTheme(
              bodyText2: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
        ),
        title: 'Dr Cash',
        home: LoginPage(),
      ),
    );
  }
}
