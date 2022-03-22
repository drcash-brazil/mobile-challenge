import 'package:get/instance_manager.dart';
import 'package:mobile_challenge/app/core/rest_client/rest_client.dart';

class ApplicationBinding implements Bindings {
  @override 
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}