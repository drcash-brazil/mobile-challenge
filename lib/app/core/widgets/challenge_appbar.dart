import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/app/core/services/auth_service.dart';

class ChallengeAppBar extends AppBar {
  ChallengeAppBar({
    Key? key,
    double elevation = 2,
    bool isButtonExit = false
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          elevation: elevation,
           actions: isButtonExit ? [
             IconButton(
              onPressed: () {
                Get.find<AuthService>().logout();
              },
              icon: const Icon(Icons.logout),
            ) ,
          ] : null,
          centerTitle: true,
          title: Image.asset(
            'assets/images/drcashlogo.png',
            width: 80,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        );
}
