import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/params/clinic_params.dart';
import '../../data/models/clinic_model.dart';
import '../../external/dr_cash_get_remote_clinics.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_carousel_slider.dart';
import '../widgets/custom_clinic_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  List<String> bannerImages = [
    "https://www.drcash.com.br/img/Home/banners4.jpg",
    "https://www.drcash.com.br/img/Home/banners.png",
    "https://www.drcash.com.br/img/Home/banners2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                'https://www.drcash.com.br/img/Home/banners1.png',
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topLeft),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCarouselSlider(bannerImages: bannerImages),
                          SizedBox(height: 20),
                          Text("Clinicas Parceiras"),
                          SizedBox(height: 20),
                          FutureBuilder<List<ClinicModel>>(
                              future: context
                                  .read<DrCashGetRemoteClinics>()
                                  .getClinics(ClinicParams(
                                    pageNumber: 1,
                                    pageSize: 40,
                                  )),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return SizedBox(
                                    height: snapshot.data.length * 40.0,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return CustomClinicCard(
                                            title: snapshot
                                                .data[index].tradingName,
                                            city: snapshot.data[index].city,
                                            clinicType:
                                                snapshot.data[index].clinicType,
                                            phoneNumber: snapshot
                                                .data[index].phoneNumber,
                                            state: snapshot.data[index].state,
                                          );
                                        }),
                                  );
                                }
                                return Center(
                                  child: LoadingAnimationWidget.hexagonDots(
                                    color: Color(0xFF00bf9c),
                                    size: 50,
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF00bf9c),
          onPressed: () {},
          child: Icon(Icons.message)),
    );
  }
}
