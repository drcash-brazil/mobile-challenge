import 'package:flutter/material.dart';

class LoginFormPage extends StatefulWidget {
  final String title;
  const LoginFormPage({Key? key, this.title = 'LoginFormPage'})
      : super(key: key);
  @override
  LoginFormPageState createState() => LoginFormPageState();
}

class LoginFormPageState extends State<LoginFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
