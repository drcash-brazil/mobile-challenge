import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/models/home/clinics_list.dart';
import '../../../core/services/home/home_service.dart';
import '../../../core/util/base_colors.dart';
import '../../signin/widgets/message_error.dart';
import '../components/backGround.dart';
import '../components/banner.dart';
import '../components/buildGreetings.dart';
import '../components/buildMoodsHolder.dart';
import '../widgets/clinics_list.dart';
import 'package:provider/provider.dart';

import 'home.text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ClinicData>> consultClinics;
  final scrollController = ScrollController();
  int activeIndex = 0;
  var urlImages = [
    'https://www.drcash.com.br/img/Home/banners1.png',
    'https://www.drcash.com.br/img/Home/banners2.png',
    'https://www.drcash.com.br/img/Home/banners3.png',
    'https://www.drcash.com.br/img/Home/banners4.jpg',
  ];

  @override
  void initState() {
    consultClinics = context.read<HomeDTO>().getClinic(1, 40, "", "", "");
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetch();
      }
    });
  }

  Future fetch() async {
    setState(() {
      consultClinics = context.read<HomeDTO>().getClinic(1, 40, "", "", "");
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          backgroundColor: BaseColors.drCashPrimary,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.exit_to_app),
                label: HomeText.exitHome,
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.topCenter,
                children: const <Widget>[
                  BackGround(),
                  BuildGreetings(),
                  BuildMoodsHolder(),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              CarouselSlider.builder(
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return _buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                      height: 180,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      })),
              const SizedBox(
                height: 8,
              ),
              _buildIndicator(),
              const SizedBox(
                height: 12,
              ),
              const BuildBanner(),
              const SizedBox(
                height: 12,
              ),
              _buildListClinics(),
            ],
          ),
        ));
  }

  Widget _buildImage(String urlImage, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }

  _buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
      effect: const JumpingDotEffect(
          dotWidth: 14,
          dotHeight: 14,
          dotColor: Colors.grey,
          activeDotColor: BaseColors.drCashPrimary),
    );
  }

  _buildListClinics() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                HomeText.clinicsPartners,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
        FutureBuilder<List<ClinicData>>(
          future: consultClinics,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(
                    color: BaseColors.drCashPrimary,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return const MessageError(
                    text: HomeText.failGet,
                  );
                } else if (snapshot.hasData) {
                  var myList = snapshot.data! as List<ClinicData>;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: snapshot.data?.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index < snapshot.data!.length) {
                            final item = snapshot.data![index];
                            return ClinicsCard(
                              title: myList[index].tradingName!,
                              city: myList[index].city!,
                              state: myList[index].state!,
                              clinicType: myList[index].clinicType!,
                            );
                          }
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 32.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: BaseColors.drCashPrimary,
                              ),
                            ),
                          );
                        }),
                  );
                }
            }
            return Container();
          },
        ),
      ],
    );
  }
}
