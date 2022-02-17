import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poccash/app/modules/home/home_store.dart';
import 'package:poccash/app/shared/core/color/app_colors.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Observer(
        builder: (_) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white70,
            child: _listMenu(),
          );
        },
      ),
    );
  }

  //identifica qual item foi selecionado
  int itemSelect = 0;

//Cria uma listview com os itens do menu
  Widget _listMenu() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _avatar(),
          const Divider(color: Colors.black),
          const SizedBox(
            height: 10,
          ),
          const Spacer(),
          _tiles("Sair", Icons.history, 1, () {
            store.logout();
          }),
          Text(
            "Vr 1.0",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.colorPrimary,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

//cria cada item do menu
  Widget _tiles(
      String text, IconData icon, int item, GestureTapCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.colorPrimary),
      onTap: onTap,
      selected: item == itemSelect,
      title: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  //cria o avatar com nome, email e imagem
  Widget _avatar() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: AppColors.colorPrimary,
            child: const Text(
              'Dr',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            height: 12.0,
          ),
          const Text(
            "Dr Cash",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const Text(
            "dr@gmail.com",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
