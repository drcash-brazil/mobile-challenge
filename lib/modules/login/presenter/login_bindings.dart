import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/modules/login/domain/usecases/login_usecase.dart';
import 'package:mobile_challenge/modules/login/external/datasources/login_datasource.dart';
import 'package:mobile_challenge/modules/login/infra/repositories/login_repository.dart';

import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(LoginDatasource(Get.find<Dio>()));

    Get.put(LoginRepository(Get.find<LoginDatasource>()));
    Get.put(LoginUsecase(Get.find<LoginRepository>()));

    Get.put(LoginController(Get.find<LoginUsecase>()));
  }
}
