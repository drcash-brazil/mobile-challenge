import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/modules/home/domain/usecases/get_clinics_usecase.dart';
import 'package:mobile_challenge/modules/home/infra/repositories/home_repository.dart';

import './home_controller.dart';
import '../external/home_datasource.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeDatasource(Get.find<Dio>()));
    Get.put(HomeRepository(Get.find<HomeDatasource>()));
    Get.put(GetClinicsUsecase(Get.find<HomeRepository>()));

    Get.put(HomeController(Get.find<GetClinicsUsecase>()));
  }
}
