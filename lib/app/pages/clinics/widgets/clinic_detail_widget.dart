import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_challenge/app/data/model/clicnic_model.dart';

class ClinicDetailWidget extends GetView {
  ClinicModel? clinic;
  String name;
  Icon icon; 
  bool? isNameClinic;

  ClinicDetailWidget({ required this.name, required this.icon, this.isNameClinic = false});

  @override 
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: Text(name, overflow: isNameClinic! ? TextOverflow.ellipsis : TextOverflow.visible,),
        ),
      ],
    );
  }
}
