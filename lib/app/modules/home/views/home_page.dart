import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../modules/util/constants/icons_constants.dart';
import '../../util/colors/colors.dart';
import '../stores/clinics_store.dart';

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
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
            child: SvgPicture.asset(
              IconConstant.logoWide,
              color: ColorsConstants.white,
              height: MediaQuery.of(context).size.height * .05,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: ColorsConstants.white,
                  size: 18.0,
                ))
          ],
          backgroundColor: ColorsConstants.primary,
          centerTitle: true,
        ),
        body: Container(),
      ),
    );
  }
}
