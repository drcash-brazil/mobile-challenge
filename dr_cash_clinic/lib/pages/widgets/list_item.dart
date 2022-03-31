import 'package:dr_cash_clinic/models/clinic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatefulWidget {
  final Clinic clinic;
  HomeListItem(this.clinic);

  @override
  _HomeListItemState createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  void itemModal() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SvgPicture.asset(getSvg(),
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        widget.clinic.tradingName!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("${widget.clinic.city} - ${widget.clinic.state!}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text("Contato: ${widget.clinic.phoneNumber!}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(widget.clinic.clinicType!),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  getSvg() {
    switch (widget.clinic.clinicTypeId) {
      case 2:
        return "assets/svg/dentistry.svg";
      case 3:
        return "assets/svg/plastic_surgery.svg";
      case 4:
        return "assets/svg/aesthetics.svg";
      case 5:
        return "assets/svg/gynecology.svg";
      case 6:
        return "assets/svg/ophthalmology.svg";
      case 7:
        return "assets/svg/clinic.svg";
      case 8:
        return "assets/svg/hospital.svg";
      case 9:
        return "assets/svg/orthopedics.svg";
      case 10:
        return "assets/svg/exams.svg";
      case 11:
        return "assets/svg/drugstore.svg";
      default:
        return "assets/svg/clinic.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            height: 5,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
            ),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            leading: SizedBox(
              width: 50,
              child: SvgPicture.asset(getSvg(),
                  color: Theme.of(context).colorScheme.primary),
            ),
            title: Text(widget.clinic.tradingName!),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.clinic.city} - ${widget.clinic.state!}"),
                SizedBox(height: 15),
                Text(widget.clinic.clinicType!),
              ],
            ),
            onTap: () {
              itemModal();
            },
          ),
        ],
      ),
    );
  }
}
