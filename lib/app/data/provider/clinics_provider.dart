import 'dart:developer';

import 'package:mobile_challenge/app/core/rest_client/api_response.dart';
import 'package:mobile_challenge/app/core/rest_client/rest_client.dart';
import 'package:mobile_challenge/app/data/model/clicnic_model.dart';

class ClinicsProvider {
  final RestClient _restClient;

  ClinicsProvider({required RestClient restClient}) : _restClient = restClient;

  Future<ApiResponse<List<ClinicModel>>> getClinics() async {
    try {
      final response = await _restClient.get('/clinics/public');

      if(response.statusCode == 200) {
        List<ClinicModel> clinics =  response.body<List>.map((e) => ClinicModel.fromJson(e)).toList();

        return ApiResponse.ok(result: clinics);
      }
      return ApiResponse.error(msg: 'Não foi possível obter as clinícas.');
    } catch(e) {
        log('erro: $e');
        return ApiResponse.error(msg: 'Erro ao obter as clininicas.');
    }
  }
}