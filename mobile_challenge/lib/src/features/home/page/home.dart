
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/models/home/clinics_list.dart';
import '../../../core/services/home/home_service.dart';
import '../../../core/util/assets.dart';
import '../../../core/util/base_colors.dart';
import '../widgets/moods.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final urlImages = [
    'https://www.drcash.com.br/img/Home/banners1.png',
    'https://www.drcash.com.br/img/Home/banners2.png',
    'https://www.drcash.com.br/img/Home/banners3.png',
    'https://www.drcash.com.br/img/Home/banners4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: BaseColors.drCashPrimary,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.exit_to_app),
            label: 'Sair',
            onTap: (){
              Navigator.pop(context);
            }
          )
        ],
      ),
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              _backGround(),
              _buildGreetings(),
              _buildMoodsHolder(),
            ],
          ),
          SizedBox(
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
                  autoPlayInterval: Duration(seconds: 3),
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  })),
          SizedBox(
            height: 8,
          ),
          _buildIndicator(),
          SizedBox(
            height: 12,
          ),
          _buildBanner(),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Clínicas Parceiras',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          _buildListClinics(),
        ],
      ),
    ));
  }

  _backGround() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: BaseColors.drCashPrimary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          )),
    );
  }

  _buildGreetings() {
    return Positioned(
        left: 20.0,
        bottom: 90.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Oi Lucas,',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Como você está se sentindo hoje?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }

  _buildMoodsHolder() {
    return Positioned(
        bottom: -45,
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width - 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5.5,
                  blurRadius: 5.5,
                )
              ]),
          child: MoodsHome(),
        ));
  }

  _buildImage(String urlImage, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 12),
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
      effect: JumpingDotEffect(
          dotWidth: 14,
          dotHeight: 14,
          dotColor: Colors.grey,
          activeDotColor: BaseColors.drCashPrimary),
    );
  }

  _buildBanner() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: BaseColors.drCashPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Com a Dr.Cash você tem mais motivos para aproveitar sua saúde! Aproveite alguns dos nossos parceiros abaixo.',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildListClinics(){
    return Container(
      child: Column(
        children: [
FutureBuilder<ClinicData>(future: context.read<HomeDTO>().getClinic(1,40,"","",""),
    builder: (context, snapshot) {
      if(snapshot.hasData){
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView.builder(itemBuilder: (context, index){
            return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF00bf9c),
                  ),
                ),
                content: Container(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Cidade:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'city',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Estado:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'state',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Tipo:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'clinicType',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Telefone:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'phoneNumber',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(
                0,
                0,
              ),
            )
          ],
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Color(0xFF00bf9c),
              width: 3,
            ),
          ),
        ),
        child: Row(
          children: [
    
          ],
        ),
      ),
    );
          }),
        );
      }
      return SizedBox();
    },),
        ],
      ),
    );
    
  }
}
