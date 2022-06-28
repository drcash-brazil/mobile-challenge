import 'package:flutter/material.dart';
import 'package:mobile_challenge/src/core/constants/routes.dart';
import 'package:mobile_challenge/src/core/services/home/home_service.dart';
import 'package:mobile_challenge/src/core/services/signin/signin_service.dart';
import 'package:mobile_challenge/src/core/util/global_context.dart';
import 'package:mobile_challenge/src/core/util/service_location.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SigninDTO()),
        ChangeNotifierProvider(create: (_) => HomeDTO())
      ],
      child: MaterialApp(
      title: 'Dr. Cash',
      debugShowCheckedModeBanner: false,
      //navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: AppRouteNames.greetings,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        maintainState: false,
        builder: (context) {
          GlobalContext.I.setContext(context);
          return AppRoutes.routes[settings.name]?.call(settings.arguments) ??
              Text('Página inválida');
        },
      ),
    ));
  }
}