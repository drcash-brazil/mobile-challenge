import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/modules/home/domain/usecases/get_clinics_usecase.dart';

import '../../login/domain/entities/clinic_entity.dart';

class HomeController extends GetxController {
  final GetClinicsUsecase _getClinicsUsecase;
  HomeController(this._getClinicsUsecase);

  final scrollController = ScrollController();
  var clinics = <ClinicEntity>[].obs;
  int currentPageNumber = 0;

  Future<List<ClinicEntity>> getClinics({int pageNumber = 0}) async {
    clinics.value = await _getClinicsUsecase(pageNumber);
    return clinics;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
