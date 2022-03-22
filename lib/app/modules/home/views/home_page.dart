import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import '../../../app_routing.dart';
import '../../../modules/util/constants/icons_constants.dart';
import '../../util/colors/colors.dart';
import '../stores/clinics_store.dart';
import 'widgets/clinics_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.clinicsStore,
  }) : super(key: key);

  final ClinicsStore clinicsStore;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, ClinicsStore>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.clinicsStore.getAllClinics(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Material(
        child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .01),
                child: SvgPicture.asset(
                  IconConstant.logoWide,
                  color: ColorsConstants.white,
                  height: MediaQuery.of(context).size.height * .05,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Ops...'),
                            content: const Text(
                                'Você esta prestes a sair de sua conta, deseja realmente sair ?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () => widget
                                    .clinicsStore.clinicsController.appStore
                                    .pushNamed(
                                        rout: AppRouteNamed.login.fullPath!,
                                        isReplacement: true),
                                child: const Text('Sim'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      ColorsConstants.success),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => widget
                                    .clinicsStore.clinicsController.appStore
                                    .modularPop(),
                                child: const Text('Não'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      ColorsConstants.orangeLight),
                                ),
                              ),
                            ],
                          );
                        }),
                    icon: const Icon(
                      Icons.logout,
                      color: ColorsConstants.white,
                      size: 18.0,
                    ))
              ],
              backgroundColor: ColorsConstants.primary,
              centerTitle: true,
            ),
            body: Skeleton(
              isLoading: widget.clinicsStore.isLoading,
              skeleton: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: SkeletonItem(
                        child: Column(
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: double.infinity,
                            minHeight: MediaQuery.of(context).size.height / 8,
                            maxHeight: MediaQuery.of(context).size.height / 3,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, index) {
                  return ClinicsWidget(
                    clinic: widget.clinicsStore.clinics[index],
                    index: index,
                  );
                },
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const Divider(color: ColorsConstants.cinzaSGS),
                itemCount: widget.clinicsStore.clinics.length,
              ),
            )),
      );
    });
  }
}
