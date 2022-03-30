import 'package:dr_cash_clinic/models/user.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    void exit() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Lottie.asset("assets/alert.json", repeat: false),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Tem certeza que deseja sair ?",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
               ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey[600]),
                child: Text("Sim"),
                onPressed: () {
                  User.logout();
                },
              ),
              ElevatedButton(
                child: Text("Voltar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(title: Text("Home")),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 100,
                          child: Lottie.asset("assets/user.json", repeat: false),
                        ),
                      ),
                      Text(
                        User.email!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.exit_to_app),
                title: Text("Sair"),
                onTap: () {
                  exit();
                },
              ),
            ],
          ),
        ),
        body: Center(child: Text("Home")),
        floatingActionButton: FloatingActionButton(onPressed: () {
            String url ="https://wa.me/+5567999241871/";
            launch(url);
        },
        backgroundColor: Colors.green[700],
        child: Icon(Icons.whatsapp),
        ),
      ),
    );
  }
}
