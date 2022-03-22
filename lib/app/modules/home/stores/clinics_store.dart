import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/api_response.model.dart';
import '../../util/alert_awesome/alert_awesome_widget.dart';
import '../controllers/clinics/clinics_controller.dart';
import '../models/clinics/clinics_model.dart';

part 'clinics_store.g.dart';

class ClinicsStore = _ClinicsStoreBase with _$ClinicsStore;

abstract class _ClinicsStoreBase with Store {
  _ClinicsStoreBase({required this.clinicsController});

  final ClinicsController clinicsController;
//----------------------------------------------------------------------------
  @observable
  List<ClinicsModel> clinics = [];
//----------------------------------------------------------------------------
  @observable
  bool isLoading = false;
//----------------------------------------------------------------------------
  Future<void> getAllClinics({required BuildContext context}) async {
    isLoading = true;
    ApiResponseModel? apiResponseModel =
    await clinicsController.getAllClinics(context: context);

    if (apiResponseModel?.statusCode == 200) {
      clinics = apiResponseModel?.data['data'].map<ClinicsModel>((e) {
        return ClinicsModel.fromJson(e);
      }).toList();
    } else {

      awesomeDialogWidget(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.NO_HEADER,
          text: apiResponseModel?.data['errors'][0],
          title: 'Ops...',
          borderColor: Colors.red,
          buttonColor: Colors.red.shade800,
          btnOkOnPress: () {});
    }
    isLoading = false;
  }

//----------------------------------------------------------------------------
}
