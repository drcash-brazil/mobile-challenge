import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/api_response.model.dart';
import '../../../../core/routes/api.routes.dart';
import '../../../util/alert_awesome/alert_awesome_widget.dart';
import '../../../../core/interfaces/api.interface.dart';
import '../../interfaces/clinics/clinics_repository_interface.dart';

class ClinicsRepository implements IClinicsRepository {
  ClinicsRepository(this._api);

  final IApi _api;
//----------------------------------------------------------------------------
  @override
  Future<ApiResponseModel?> getAllClinics({required context}) async {
    try {
      ApiResponseModel response = await _api
          .call(type: EApiType.get, url: ApiRoutes.getClinics, headers: {
        'Content-Type': 'application/json',
      }).catchError((e) {
        awesomeDialogWidget(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            text: e.response.data['errors'][0],
            title: 'Ops...',
            borderColor: Colors.red,
            buttonColor: Colors.red.shade800,
            btnOkOnPress: () {});
      });
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

//----------------------------------------------------------------------------
}
