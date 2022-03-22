import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_challenge/app/core/constants/constants.dart';
import 'package:mobile_challenge/app/data/model/user_model.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER, (value) {
      _isLogged(value != null);
    });
 
    ever<bool?>(_isLogged, (isLogged) {
      if(isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      }else {
        Get.offAllNamed('/home');
      }
    });

    _isLogged(getUser() != null);
    
    return this;
  }

  void logout() => _getStorage.write(Constants.USER, null);

   getUser() {
     _getStorage.read(Constants.USER);
     //logout();
   }
}