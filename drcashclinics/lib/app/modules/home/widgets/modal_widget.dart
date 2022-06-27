import 'package:drcashclinics/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalWidget extends StatefulWidget {
  final int index;

  const ModalWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        child: AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              color: Color(0xffEEEEEE),
            ),
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        controller.getIconByClinicType(
                            controller.homeModelList[widget.index].clinicType!),
                      ),
                      Text(controller.homeModelList[widget.index].tradingName!),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    elevation: 0,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Clínica ${controller.homeModelList[widget.index].tradingName} especializada em ${controller.homeModelList[widget.index].clinicType}, localizada em ${controller.homeModelList[widget.index].city} - ${controller.homeModelList[widget.index].state}. \n\nPara mais informações entre em contato (99) 99999-9999",
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
