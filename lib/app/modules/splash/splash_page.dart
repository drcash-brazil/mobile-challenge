import 'package:dr_cash_clinic/app/core/constants.dart';
import 'package:dr_cash_clinic/app/modules/login/login_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

//import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/logofullbranco@2x.png'),
        nextScreen: const LoginScreenPage(),
        //nextScreen: const HomePage(),
        //nextScreen: const NoteList(),
        splashTransition: SplashTransition.fadeTransition,
        //nextScreen: nextScreen),
        backgroundColor: kPrimaryColor,
        duration: 3000,
      ),
    );
  }
}
