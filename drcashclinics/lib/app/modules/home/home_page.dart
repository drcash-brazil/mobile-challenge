import 'package:drcashclinics/app/modules/home/home_controller.dart';
import 'package:drcashclinics/app/modules/home/widgets/appbar_widget.dart';
import 'package:drcashclinics/app/modules/home/widgets/drawer_widget.dart';
import 'package:drcashclinics/app/modules/home/widgets/modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Modular.get();

    return Observer(builder: (_) {
      return Scaffold(
        drawer: DrawerWidget(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: HomeAppbar(),
        ),
        body: controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.homeModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Observer(builder: (_) {
                      return Card(
                        elevation: 8.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    width: 1.0,
                                    color: Color(0xff06c9ad),
                                  ),
                                ),
                              ),
                              child: Icon(
                                controller.getIconByClinicType(controller
                                    .homeModelList[index].clinicType!),
                                color: Color(0xff06c9ad),
                                size: 30,
                              ),
                            ),
                            title: Text(
                              controller.homeModelList[index].tradingName!,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.homeModelList[index].clinicType!,
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "${controller.homeModelList[index].city!} - ${controller.homeModelList[index].state!}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.addFavorite(
                                      controller.homeModelList[index]);
                                });
                              },
                              child: Icon(
                                controller.isFavorited(
                                        controller.homeModelList[index])
                                    ? Icons.star
                                    : Icons.star_border_outlined,
                                color: Colors.yellow[800],
                                size: 30.0,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => ModalWidget(
                                  index: index,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
      );
    });
  }
}
