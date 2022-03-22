import 'package:get/get.dart';
import 'package:mobile_challenge/app/data/provider/login_provider.dart';
import 'package:mobile_challenge/app/data/repository/login/login_repository.dart';
import 'package:mobile_challenge/app/data/repository/login/login_repository_impl.dart';
import 'package:mobile_challenge/app/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override 
  void dependencies() {
    Get.lazyPut(() => LoginProvider(restClient: Get.find()));
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(loginProvider: Get.find()));
    Get.lazyPut(() => LoginController(loginRepository: Get.find()));
  }
}