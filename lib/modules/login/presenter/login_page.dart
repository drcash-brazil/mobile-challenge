import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller.emailEC,
          ),
          TextFormField(
            controller: controller.passwordEC,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await controller.login();
              },
              child: const Text('Entrar'),
            ),
          ),
        ],
      ),
    );
  }
}
