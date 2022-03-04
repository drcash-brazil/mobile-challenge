import 'package:dr_cash_clinic/app/components/default_button.dart';
import 'package:dr_cash_clinic/app/components/social_card_page.dart';
import 'package:dr_cash_clinic/app/core/constants.dart';
import 'package:dr_cash_clinic/app/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logofullbranco@2x.png',
            fit: BoxFit.fill),
        actions: [
          Icon(Icons.settings),
          SocialCardPage(
            icon: 'assets/icons/Bell.svg',
          )
        ],
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF06D6A0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  press: () {
                    Modular.to.navigate('/clinics');
                  },
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
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.maps_home_work, color: Colors.white),
                            Text('Cobertura',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        width: 160,
                        height: 160,
                        color: kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.money, color: Colors.white),
                            Text('Reembolso',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
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
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.person, color: Colors.white),
                            Text('Meu Perfil',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        width: 160,
                        height: 160,
                        color: kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.message, color: Colors.white),
                            Text('Fale Conosco',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
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
      ),
    );
  }
}
