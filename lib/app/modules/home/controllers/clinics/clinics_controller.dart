import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/api_response.model.dart';
import '../../../util/alert_awesome/alert_awesome_widget.dart';
import '../../../../app_store.dart';
import '../../interfaces/clinics/clinics_repository_interface.dart';

class ClinicsController {
  ClinicsController(this._clinicsRepository, this._appStore);

  final IClinicsRepository _clinicsRepository;

  final AppStore _appStore;

  AppStore get appStore => _appStore;

  //----------------------------------------------------------------------------
  Future<ApiResponseModel?> getAllClinics({
    required context,
  }) async {
    try {
      var connectivityResult = await _appStore.checkConnectivity();

      if (connectivityResult) {
        ApiResponseModel? apiResponseModel =
            await _clinicsRepository.getAllClinics(
          context: context,
        );

        return apiResponseModel;
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
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

//----------------------------------------------------------------------------

}
