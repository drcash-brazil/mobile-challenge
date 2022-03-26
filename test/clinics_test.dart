import 'dart:convert';
import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mobile_challenge/app/core/rest_client/api_response.dart';
import 'package:mobile_challenge/app/data/model/clicnic_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class ClientMock extends Mock implements http.Client {}

void main() {
  final client = ClientMock();

  final provider = ClinicsProviderTest(client);
 
  test('Deve receber uma lista de clinicas clinicas', () async {
    when(client).calls(#get).thenAnswer((_) async  => http.Response(jsonDecode(jsonFake), 200));
    
    ApiResponse<List<ClinicModel>> list = await provider.getClinics();
    expect(list.result?.isNotEmpty, equals(true));
  });
}  

class ClinicsProviderTest {
  final Client client;

  ClinicsProviderTest(this.client);

  Future<ApiResponse<List<ClinicModel>>> getClinics() async {
    try {
      final response = await http.get(Uri.parse('https://apihml.drcash.com.br/api/v1/clinics/public'));

      if(response.statusCode == 200) {
        List<ClinicModel> clinics =  (jsonDecode(response.body)['data'] as List).map((e) => ClinicModel.fromJson(e)).toList();
        return ApiResponse.ok(result: clinics);
      } 
      return ApiResponse.error(msg: 'Não foi possível obter as clinícas.');
    } catch(e) {
        log('erro: $e');
        return ApiResponse.error(msg: 'Erro ao obter as clininicas.');
    }
  }
}

const jsonFake = '{"data":[{"id":2230,"tradingName":"MedicMais Taua", "city":"Rio de Janeiro", "state":"RJ","clinicTypeId":7, "clinicType":"Clinica geral", "phoneNumber":"(21) 9 9223-6797", "isActive":true,},],"pageNumber":1,   "pageSize":500,   "totalElements":1646,   "nextPage":"http://apihml.drcash.com.br/api/v1/clinics/public/?pageNumber=2&pageSize=500",   "previousPage":null,   "totalActiveClinic":1646}';
const jsonFake2 = '{"data111:[{"id":2230,"tradingName":"MedicMais Taua", "city":"Rio de Janeiro", "state":"RJ","clinicTypeId":7, "clinicType":"Clinica geral", "phoneNumber":"(21) 9 9223-6797", "isActive":true,},],"pageNumber":1,   "pageSize":500,   "totalElements":1646,   "nextPage":"http://apihml.drcash.com.br/api/v1/clinics/public/?pageNumber=2&pageSize=500",   "previousPage":null,   "totalActiveClinic":1646}';
