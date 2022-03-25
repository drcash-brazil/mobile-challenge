import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/app/core/themes/theme_ui.dart';
import 'package:mobile_challenge/app/core/widgets/challenge_appbar.dart';
import 'package:mobile_challenge/app/core/widgets/challenge_button.dart';
import 'package:mobile_challenge/app/core/widgets/slide_animation.dart';
import 'package:mobile_challenge/app/data/model/clicnic_model.dart';
import 'package:mobile_challenge/app/modules/clinics/clinics_controller.dart';
import 'package:mobile_challenge/app/pages/clinics/widgets/clinic_detail_widget.dart';

class ClinicsPage extends GetView<ClinicsController> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChallengeAppBar(isButtonExit: true),
      body: Obx(() => Visibility(
        visible: controller.isAnimation.value,
        child: SlideAnimation(
              position: 0,
              itemCount: 1,
              slideDirection: SlideDirection.fromTop,
              animationController: controller.animationController!,
              child: RefreshIndicator(
                onRefresh: () async => controller.refreshPage(),
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: controller.clinics.length,
                  itemBuilder: (BuildContext context, int index) {
                    ClinicModel clinic = controller.clinics[index];
                    return InkWell(
                      onTap: () {
                        _showClinic(clinic: clinic);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClinicDetailWidget(
                                name: clinic.tradingName!,
                                icon: const Icon(Icons.local_hospital, color: ThemeUI.primaryColor,),
                                isNameClinic: true,
                              ),
                              const SizedBox(height: 10),
                              ClinicDetailWidget(
                                name: clinic.phoneNumber!,
                                icon: const Icon(Icons.phone, color: ThemeUI.primaryColor,),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
      )),
    );
  }

  _showClinic({ClinicModel? clinic}) {
    Get.defaultDialog(
      title: 'Clínica',
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.all(15),
      cancel: ChallengeButton(
          label: 'Fechar', height: 30, onPressed: () => Get.back()),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClinicDetailWidget(
              name: clinic!.tradingName!,
              icon: const Icon(Icons.local_hospital, color: ThemeUI.primaryColor),
              isNameClinic: true,
            ),
            const SizedBox(height: 10),
            ClinicDetailWidget(
              name: clinic.phoneNumber!,
              icon: const Icon(Icons.phone, color: ThemeUI.primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
            ClinicDetailWidget(
              name: clinic.state!,
              icon: const Icon(Icons.place, color: ThemeUI.primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
            ClinicDetailWidget(
              name: clinic.city!,
              icon: const Icon(Icons.location_city, color: ThemeUI.primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
            ClinicDetailWidget(
              name: clinic.clinicType!,
              icon: const Icon(Icons.segment, color: ThemeUI.primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
