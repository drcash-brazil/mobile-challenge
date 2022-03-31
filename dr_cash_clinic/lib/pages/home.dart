import 'package:dr_cash_clinic/models/address_state.dart';
import 'package:dr_cash_clinic/settings/settings.dart';
import 'package:dr_cash_clinic/models/user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dr_cash_clinic/api/api.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String select = "ALL";

  @override
  void initState() {
    super.initState();
  }

  List<AddressState> getAddressStates() {
    var json = Settings.address["states"] as List;
    return json.map((item) => AddressState.fromJson(item)).toList();
  }

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
                          child:
                              Lottie.asset("assets/user.json", repeat: false),
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
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton(
                    value: select == "" ? null : select,
                    hint: Text("Estado"),
                    itemHeight: null,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        select = value.toString();
                      });
                    },
                    items: getAddressStates().map((item) {
                      return DropdownMenuItem(
                          value: item.value, child: Text(item.name!));
                    }).toList(),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: FutureBuilder(
                future: Api().getClinics(this.select),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Lottie.asset("assets/search.json"));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 3,
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.business_outlined,
                                color: Colors.white),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(snapshot.data[index].tradingName!),
                          subtitle: Text(snapshot.data[index].city!),
                          trailing: Icon(Icons.open_in_full),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            String url = "https://wa.me/+5567999241871/";
            launch(url);
          },
          backgroundColor: Colors.green[700],
          child: Icon(
            Icons.whatsapp,
            size: 40,
          ),
        ),
      ),
    );
  }
}
