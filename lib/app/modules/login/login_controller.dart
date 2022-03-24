import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_challenge/app/core/constants/constants.dart';
import 'package:mobile_challenge/app/core/mixins/loader_mixin.dart';
import 'package:mobile_challenge/app/core/mixins/messages_mixin.dart';
import 'package:mobile_challenge/app/core/rest_client/api_response.dart';
import 'package:mobile_challenge/app/data/model/user_model.dart';
import 'package:mobile_challenge/app/data/repository/login/login_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginRepository? _loginRepository;

  //observables
  final _isLoading = false.obs; 
  final _message = Rxn<MessageModel>();

  LoginController({required LoginRepository loginRepository}) : _loginRepository = loginRepository;

  @override 
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loaderListener(_isLoading);
    messageListener(_message);
  }

  void login({required String email, required String password}) async {
    _isLoading.value = true;
    ApiResponse<UserModel> response  = await _loginRepository!.login(email, password);
  
    if(response.ok!) {
      final storage = GetStorage();
      storage.write(Constants.USER_ACCESS_TOKEN, response.result!.accessToken);
    } else {  
      _message(
        MessageModel(title: 'Erro', message: response.msg!, type: MessageType.error)
      );
    }
   _isLoading.value = false;
  }
}