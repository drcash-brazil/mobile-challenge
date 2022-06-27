import 'package:flutter/material.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  State<HomeAppbar> createState() => HomeAppbarState();
}

class HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff06d5a0),
              Color(0xff06babc),
            ],
          ),
        ),
      ),
      title: Center(
        child: Image.asset(
          "assets/images/logo_drCash.png",
          width: 160,
          height: 80,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.person, size: 30),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(null),
        ),
      ],
    );
  }
}
