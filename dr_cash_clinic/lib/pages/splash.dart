import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../api/api.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) async {
      SharedPreferences storage = await SharedPreferences.getInstance();
      Api(storage: storage).validateToken().then((value) {
          if(value) {
            Get.toNamed('/home');
          };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(6, 197, 177, 1),
            Color.fromRGBO(6, 203, 171, 1),
            Color.fromRGBO(6, 213, 161, 1)
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            child: SizedBox(
              width: 128,
              height: 128,
              child: Lottie.asset("assets/splash.json"),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: SizedBox(
              child: Image.asset("assets/logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
