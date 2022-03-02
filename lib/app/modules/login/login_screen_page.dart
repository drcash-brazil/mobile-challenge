import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../core/size_config.dart';
import 'components/body_page.dart';

class LoginScreenPage extends StatefulWidget {
  final String title;
  const LoginScreenPage({Key? key, this.title = 'Sign In'}) : super(key: key);
  @override
  LoginScreenPageState createState() => LoginScreenPageState();
}

class LoginScreenPageState extends State<LoginScreenPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(widget.title),
      ),
      body: const BodyPage(),
    );
  }
}
