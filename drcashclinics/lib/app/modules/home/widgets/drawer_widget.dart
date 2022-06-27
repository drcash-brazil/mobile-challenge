import 'package:drcashclinics/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final LoginController loginController = Modular.get();

    return Drawer(
      width: size.width * .7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff06d5a0),
                  Color(0xff06babc),
                ],
              ),
            ),
            padding: EdgeInsets.all(30),
            child: Container(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset("assets/images/d_logo.png"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xff06d5a0),
            ),
            title: Text('Home'),
            onTap: () {
              Modular.to.navigate('/home/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text('Sair'),
            onTap: () {
              loginController.logout();
            },
          ),
        ],
      ),
    );
  }
}
