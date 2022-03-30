import 'package:dr_cash_clinic/storage/storage.dart';
import 'package:dr_cash_clinic/models/token.dart';
import 'package:get/get.dart';

class User {
  static String? email;

  static add(identity) {
    email = identity;
    Storage.saveUser(identity);
  }

  static addStorageData(storage) {
    email = storage.getString("email");
  }

  static clean() {
    email = null;
    Storage.removeUser();
  }

  static login() {            
    Get.toNamed('/home');                     
  }
  
  static logout() {
    clean();
    Token.clean();

    Get.toNamed('/');
  }
}