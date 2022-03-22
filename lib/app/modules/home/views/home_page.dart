import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../modules/util/constants/icons_constants.dart';
import '../../util/colors/colors.dart';
import '../stores/clinics_store.dart';


class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key, required this.clinicsStore,})
      : super(key: key);

  final ClinicsStore clinicsStore;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, ClinicsStore>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0);
    widget.clinicsStore.getAllClinics(context: context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
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
            backgroundColor: ColorsConstants.primary,
            centerTitle: true,
          ),
          body: Container(),
        ),
      ),
    );
  }
}
