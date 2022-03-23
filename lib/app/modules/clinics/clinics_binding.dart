import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/app/data/provider/clinics_provider.dart';
import 'package:mobile_challenge/app/data/repository/clinics/clinics_repository.dart';
import 'package:mobile_challenge/app/data/repository/clinics/clinics_repository_impl.dart';
import 'package:mobile_challenge/app/modules/clinics/clinics_controller.dart';

class ClinicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClinicsProvider(restClient: Get.find()));
    Get.lazyPut<ClinicsRepository>(() => ClinicsRepositoryImpl(clinicsProvider: Get.find()));
    Get.lazyPut(() => ClinicsController(clinicsRepository: Get.find()));
  }

}