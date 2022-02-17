import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:poccash/app/shared/core/routes/app_routes.dart';
import 'package:poccash/app/shared/enums/request_state_enum.dart';
import 'package:poccash/app/shared/models/response/clinic_response_model.dart';
import 'package:poccash/app/shared/repositories/clinic_repository.dart';
import 'package:poccash/app/shared/repositories/interfaces/i_storage_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IStorageRepository? _storage;
  final ClinicRepository? _clinicRepository;

  HomeStoreBase(
    this._storage,
    this._clinicRepository,
  ) {
    load();
  }
  @observable
  RequestStateEnum requestState = RequestStateEnum.idle;

  @observable
  List<ClinicDataResponseModel?> listClinics = <ClinicDataResponseModel>[];

  Future<void> load() async {
    try {
      requestState = RequestStateEnum.loading;

      var clinics = await _clinicRepository?.getClinics();
      if (clinics != null && clinics.data != null) {
        listClinics.addAll(clinics.data!);
      }
    } catch (_) {}
    requestState = RequestStateEnum.success;
  }

  @action
  Future<void> logout() async {
    await _storage!.removeAll();
    await Modular.to.pushReplacementNamed(AppRoutes.auth);
  }
}
