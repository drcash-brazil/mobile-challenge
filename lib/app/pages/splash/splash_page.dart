import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends GetView {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Center(
          child: Image.asset(
            'assets/images/drcashlogo.png',
            width: 200,
          )
        ),
      ],
    );
  }
}