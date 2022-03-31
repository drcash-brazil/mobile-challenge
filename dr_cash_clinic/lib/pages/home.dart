import 'package:dr_cash_clinic/pages/widgets/list_item.dart';
import 'package:dr_cash_clinic/models/address_state.dart';
import 'package:dr_cash_clinic/models/clinic_type.dart';
import 'package:dr_cash_clinic/settings/settings.dart';
import 'package:dr_cash_clinic/models/user.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  var _search = TextEditingController();
  String addressState = "ALL";
  int clinicType = 1;
  Future clinics = Api().getClinics("", 1, "");

  @override
  void initState() {
    super.initState();
  }

  List<AddressState> getAddressStates() {
    var json = Settings.address["states"] as List;
    return json.map((item) => AddressState.fromJson(item)).toList();
  }

  List<ClinicType> getClinicTypes() {
    var json = Settings.address["clinicType"] as List;
    return json.map((item) => ClinicType.fromJson(item)).toList();
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
                child: Text("Não"),
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
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton(
                value: addressState,
                hint: Text("Estado - Todos"),
                itemHeight: null,
                elevation: 5,
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    addressState = value.toString();
                  });
                },
                items: getAddressStates().map((item) {
                  return DropdownMenuItem(
                      value: item.value, child: Text(item.name!));
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<int>(
                value: clinicType,
                hint: Text("Segmento - Todos"),
                elevation: 5,
                itemHeight: null,
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    clinicType = value!;
                  });
                },
                items: getClinicTypes().map((item) {
                  return DropdownMenuItem(
                      value: item.id, child: Text(item.name!));
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: _search,
                      decoration:
                          InputDecoration(labelText: "Qual é o nome da clinica?"),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          clinics = Api()
                        .getClinics(addressState, clinicType, _search.text);
                        });
                      },
                      child: SvgPicture.asset("assets/svg/search.svg",
                        width: 20, height: 20),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: clinics,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Lottie.asset("assets/search.json"));
                  } else if (snapshot.data == null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Lottie.asset("assets/alert.json",
                                repeat: false),
                          ),
                          Text("Nenhuma clinica encontrada"),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        margin: EdgeInsets.all(5),
                        child: HomeListItem(snapshot.data[index]),
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
          backgroundColor: Color(0xffb3ec24f),
          child: Icon(
            Icons.whatsapp,
            size: 40,
          ),
        ),
      ),
    );
  }
}
