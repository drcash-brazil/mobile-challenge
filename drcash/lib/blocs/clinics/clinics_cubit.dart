import 'dart:async';

import 'package:drcash/models/clinic_model.dart';
import 'package:drcash/repositories/clinic_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'clinics_state.dart';

class ClinicsCubit extends Cubit<ClinicsState> {
  final ClinicRepository repository;
  ClinicsCubit(this.repository) : super(const ClinicsState());

  loadList({int page = 1}) async {
    try {
      emit(state.copyWith(
        loading: true,
        error: null,
      ));

      ClinicResponse? response = await repository.getList(page);
      if (state.response != null) {
        response!.data = state.response!.data!..addAll(response.data!);
      }

      Timer(Duration(seconds: 3), () {
        emit(state.copyWith(
          response: response,
          loading: false,
          error: null,
        ));
      });
      // emit(state.copyWith(
      //   response: response,
      //   loading: false,
      //   error: null,
      // ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        error: e,
      ));
    }
  }
}
