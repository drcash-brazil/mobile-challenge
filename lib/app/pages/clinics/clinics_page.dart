import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_challenge/app/core/widgets/challenge_appbar.dart';
import 'package:mobile_challenge/app/data/model/clicnic_model.dart';
import 'package:mobile_challenge/app/modules/clinics/clinics_controller.dart';

class ClinicsPage extends GetView<ClinicsController> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChallengeAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: controller.clinics.length,
        itemBuilder: (BuildContext context, int index) {
          ClinicModel clinic = controller.clinics[index];
          return InkWell(
            child: Card(
              child: Column(
                children: [
                  Text('Name: ${clinic.tradingName}'),
                  SizedBox(height: 5),
                  Text('telefone: ${clinic.phoneNumber}')
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}