import 'package:dr_cash_clinic/app/components/default_button.dart';
import 'package:dr_cash_clinic/app/core/constants.dart';
import 'package:dr_cash_clinic/app/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        //title: Icons.abc ,
        actions: [Icon(Icons.settings), Icon(Icons.message)],
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF06D6A0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Card(
                color: const Color(0xFF06D6A0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.gps_fixed),
                      title: Text('LUCAS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text('Dependente'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text(
                            'MINHA LOCALIDADE',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              DefaultButton(
                press: () {},
                text: 'Pesquisar Cidades',
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              DefaultButton(
                press: () {},
                text: 'Pesquisar Estado',
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: const Center(
                          child: Text('Cobertura',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                      width: 160,
                      height: 160,
                      color: kPrimaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: const Center(
                          child: Text('Reembolso',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                      width: 160,
                      height: 160,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: const Center(
                          child: Text('Meu Perfil',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                      width: 160,
                      height: 160,
                      color: kPrimaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: const Center(
                          child: Text('Fale Conosco',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                      width: 160,
                      height: 160,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              Center(
                  child: TextButton(
                onPressed: () {},
                child: const Icon(Icons.exit_to_app),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
