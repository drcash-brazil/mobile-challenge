import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';

import '../../../core/models/api_response.model.dart';
import '../../util/colors/colors.dart';
import '../interfaces/login_repository_interface.dart';
import '../models/login_formulary_model.dart';
import '../../util/alert_awesome/alert_awesome_widget.dart';
import '../../../app_store.dart';

class LoginController {
  LoginController(this._loginRepository, this._appStore);

  final ILoginRepository _loginRepository;

  final AppStore _appStore;

  AppStore get appStore => _appStore;

  //----------------------------------------------------------------------------
  Future<ApiResponseModel?> signIn({
    required LoginFormularyModel loginFormulary,
    required context,
  }) async {
    try {
      var connectivityResult = await _appStore.checkConnectivity();

      if (connectivityResult) {
        ApiResponseModel? apiResponseModel = await _loginRepository.getLogin(
          loginFormulary: loginFormulary,
          context: context,
        );
        if (apiResponseModel != null) {
          if (apiResponseModel.statusCode == 200) {
            _appStore.saveUserSharedPrefs(
                stringValue: 'userValue',
                data: loginFormulary.login);

            return apiResponseModel;
          } else {
            awesomeDialogWidget(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.NO_HEADER,
                text: apiResponseModel.data['messages'][0]['message'],
                title: apiResponseModel.data['title'],
                borderColor: apiResponseModel.statusCode == 401
                    ? ColorsConstants.yellow
                    : Colors.red,
                buttonColor: apiResponseModel.statusCode == 401
                    ? ColorsConstants.orangeLight
                    : Colors.red.shade800,
                btnOkOnPress: () {});
          }
        } else {
          return null;
        }
      } else {
        awesomeDialogWidget(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            title: 'Erro ao obter acesso',
            text:
                'Ops\nVerifique sua conexão com a internet e tente novamente.',
            borderColor: Colors.red,
            buttonColor: Colors.red.shade800,
            btnOkOnPress: () {});
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}
