import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_challenge/app/core/constants/constants.dart';
import 'package:mobile_challenge/app/core/mixins/loader_mixin.dart';
import 'package:mobile_challenge/app/core/mixins/messages_mixin.dart';
import 'package:mobile_challenge/app/core/rest_client/api_response.dart';
import 'package:mobile_challenge/app/data/model/user_model.dart';
import 'package:mobile_challenge/app/data/repository/login/login_repository.dart';

class LoginController extends GetxController with MessagesMixin, LoaderMixin {
  final LoginRepository? _loginRepository;

  //observables
  final isLoading = false.obs; 
  final message = Rxn<MessageModel>();
  final visibilityPassword = true.obs;

  LoginController({required LoginRepository loginRepository}) : _loginRepository = loginRepository;

  @override 
  void onInit() {
    super.onInit();
  }

  void toggle() {
    visibilityPassword.value = visibilityPassword.value;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loaderListener(isLoading);
    messageListener(message);
  } 

  void login({required String email, required String password}) async {
    isLoading.value = true;
    
    ApiResponse<UserModel> response  = await _loginRepository!.login(email, password);
    if(response.ok!) {
      final storage = GetStorage();
      storage.write(Constants.USER_ACCESS_TOKEN, response.result!.accessToken);
    } else {  
      isLoading.value = false;
      message(
        MessageModel(title: 'Erro', message: response.msg!, type: MessageType.error),
      );
    }
    isLoading.value = false;
  }
}