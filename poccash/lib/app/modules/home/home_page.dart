import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poccash/app/modules/home/widgets/drawer_widget.dart';
import 'package:poccash/app/shared/core/color/app_colors.dart';
import 'package:poccash/app/shared/enums/request_state_enum.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  Animation? animationTranslate;
  Animation? animationSize;
  Animation? animationSizeBorder;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    animationTranslate = Tween(
      begin: 0.0,
      end: 300.0,
    ).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeOut,
    ));

    animationTranslate!.addListener(() {
      setState(() {});
    });

    animationSize = Tween(begin: 1.0, end: 0.8).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut));
    animationSize?.addListener(() {
      setState(() {});
    });

    animationSizeBorder = Tween(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut));
    animationSizeBorder?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController?.dispose();

    super.dispose();
  }

  _onTapMenu() {
    if (animationController!.value == 1) {
      animationController!.reverse();
    } else {
      animationController!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DrawerWidget(),
        Transform.scale(
          scale: animationSize!.value,
          child: Container(
            transform: Matrix4.identity()
              ..translate(animationTranslate!.value, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(animationSizeBorder!.value),
              child: _buildScaffold(),
            ),
          ),
        ),
      ],
    );
  }

  _buildScaffold() {
    return GestureDetector(
      onTap: () {
        animationController!.reverse();
      },
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Clínicas',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: _onTapMenu,
            child: const Icon(Icons.menu, color: Colors.white),
          ),
        ),
        body: Observer(
          builder: (context) {
            if (store.requestState == RequestStateEnum.loading) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Aguarde... Carregando clínicas"),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            if (store.listClinics.isEmpty) {
              return const Center(
                child: Text(
                  "Nenhuma clínica encontrada",
                ),
              );
            }

            return SafeArea(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: store.listClinics.length,
                    itemBuilder: (context, index) {
                      var clinic = store.listClinics[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.place,
                              color: AppColors.colorPrimary,
                            ),
                          ),
                          title: Text(clinic?.tradingName ?? ""),
                          subtitle: Text(clinic?.clinicType ?? ""),
                          trailing: const SizedBox(
                            height: 50,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              // color: AppColors.colorPrimary,
                              size: 30.0,
                            ),
                          ),
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                  title: Text(
                                    "Infomações",
                                    style: TextStyle(
                                        color: AppColors.colorPrimary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Nome: ",
                                            style: TextStyle(
                                                color: AppColors.colorPrimary,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Flexible(
                                            child: Text(
                                              clinic?.tradingName ?? "",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            "Especialicação: ",
                                            style: TextStyle(
                                                color: AppColors.colorPrimary,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Flexible(
                                            child: Text(
                                              clinic?.clinicType ?? "",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            "Telefone: ",
                                            style: TextStyle(
                                                color: AppColors.colorPrimary,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Flexible(
                                            child: Text(
                                              clinic?.phoneNumber ?? "",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            "Cidade: ",
                                            style: TextStyle(
                                                color: AppColors.colorPrimary,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Flexible(
                                            child: Text(
                                              clinic?.city ?? "",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () async {
                                        Modular.to.pop();
                                      },
                                      child: const Text("OK"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary: AppColors.colorPrimary,
                                        side: BorderSide(
                                          width: 1.0,
                                          color: AppColors.colorPrimary!,
                                        ),
                                      ),
                                    )
                                  ]),
                            );
                          },
                        ),
                      );
                    }));
          },
        ),
      ),
    );
  }
}
