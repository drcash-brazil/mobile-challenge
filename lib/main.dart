import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_challenge_drcash/config/config.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_bloc.dart';
import 'package:mobile_challenge_drcash/pages/home/home_page.dart';
import 'package:mobile_challenge_drcash/pages/login/bloc/login_bloc.dart';
import 'package:mobile_challenge_drcash/pages/login/login_page.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_repository.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_services.dart';
import 'package:mobile_challenge_drcash/services/session/session_repository.dart';
import 'package:mobile_challenge_drcash/services/session/session_services.dart';

void main() {
  SessionRepository sessionRepository = SessionRepository(
      dio: Dio(BaseOptions(
    baseUrl: Config.URLVALUE,
  )));

  ClinicsRepository clinicsRepository = ClinicsRepository(
      dio: Dio(BaseOptions(
    baseUrl: Config.URLVALUE,
  )));

  SessionService(sessionRepository: sessionRepository);
  ClinicsService(clinicsRepository: clinicsRepository);

  runApp(MyApp(
    sessionService: SessionService.instance,
    clinicsService: ClinicsService.instance,
  ));
}

class MyApp extends StatelessWidget {
  final SessionService sessionService;
  final ClinicsService clinicsService;
  const MyApp(
      {Key? key, required this.sessionService, required this.clinicsService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dr.Cash Challenger',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        routes: {
          "/login": (_) => LoginPage(),
          "/home": (_) => BlocProvider<HomeBloc>(
              create: (_) => HomeBloc(clinicsService: clinicsService),
              child: HomePage())
        },
        home: BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(sessionService: sessionService),
            child: LoginPage()));
  }
}
