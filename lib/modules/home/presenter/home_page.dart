import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './home_controller.dart';
import '../../login/domain/entities/clinic_entity.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ClinicEntity>>(
        future: controller.getClinics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return Obx(() {
            return Scrollbar(
              controller: controller.scrollController,
              child: ListView.builder(
                itemCount: controller.clinics.length,
                controller: controller.scrollController,
                itemBuilder: (context, index) {
                  final clinic = snapshot.data?[index];

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text(clinic!.state ?? '')),
                      title: Text(clinic.tradingName ?? ''),
                      subtitle: Text(clinic.clinicType ?? ''),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Contato: ${clinic.phoneNumber}'),
                                  Text('Estado: ${clinic.state}'),
                                  Text('Cidade: ${clinic.city}'),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            );
          });
        },
      ),
    );
  }
}
