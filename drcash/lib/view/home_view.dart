import 'package:drcash/model/clinic.dart';
import 'package:drcash/service/auth_service.dart';
import 'package:drcash/service/clinic_service.dart';
import 'package:drcash/view/auth/splash.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var filtroController = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          height: 50,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  "assets/dr-cash.jpg",
                  height: 150,
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            ListTile(
              leading:
                  Icon(Icons.exit_to_app, color: Theme.of(context).errorColor),
              title: Text(
                'Sair',
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Theme.of(context).backgroundColor,
                    ),
              ),
              onTap: () {
                AuthService().logoff();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashView()),
                );
              },
            ),
          ],
        ),
      ),
      body: clinics(),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            onChanged: (_filtro) {
              setState(() {
                filtroController = _filtro;
              });
            },
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Uf, Cidade",
              fillColor: Theme.of(context).primaryColorLight,
              filled: true,
              hintStyle: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).backgroundColor,
                  ),
            ),
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Theme.of(context).backgroundColor,
                ),
          ),
        ),
      ),
    );
  }

  Widget clinics() {
    return StreamBuilder<List<Clinic>>(
      stream: filtroController == null || filtroController.isEmpty
          ? ClinicService().all().asStream()
          : filtroController.length < 3 && filtroController.length > 1
              ? ClinicService().clinicState(filtroController).asStream()
              : ClinicService().clinicCity(filtroController).asStream(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                leading: Icon(Icons.health_and_safety,
                    size: 32, color: Theme.of(context).errorColor),
                title: Text(
                  snapshot.data[index].tradingName,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Theme.of(context).backgroundColor,
                      ),
                ),
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(10.00),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.health_and_safety,
                                      size: 50,
                                      color: Theme.of(context).errorColor),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Nome: ' + snapshot.data[index].tradingName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Tipo: ' + snapshot.data[index].clinicType,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                ),
                              ),
                              //city
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Cidade: ' + snapshot.data[index].city,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                ),
                              ),
                              //state
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'UF: ' + snapshot.data[index].state,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Telefone: ' +
                                      snapshot.data[index].phoneNumber,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Não há clinicas',
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Theme.of(context).backgroundColor,
                    ),
              ),
            ),
          );
        }
      }),
    );
  }
}
