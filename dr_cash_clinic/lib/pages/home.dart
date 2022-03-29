import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../api/api.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences storage = await SharedPreferences.getInstance();
            Api(storage: storage).logout();
          }, 
          child: Text("Sair")
        ),
      ),
    );
  }
}