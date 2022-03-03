import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../core/size_config.dart';
import 'components/body_page.dart';

class LoginScreenPage extends StatefulWidget {
  final String title;
  const LoginScreenPage({Key? key, this.title = 'Entrar'}) : super(key: key);
  @override
  LoginScreenPageState createState() => LoginScreenPageState();
}

class LoginScreenPageState extends State<LoginScreenPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: kPrimaryColor,
        //title: Text(widget.title),
        title: Image.asset('assets/images/logofullbranco@2x.png',
            fit: BoxFit.fill),
        centerTitle: true,
      ),
      body: const BodyPage(),
    );
  }
}
