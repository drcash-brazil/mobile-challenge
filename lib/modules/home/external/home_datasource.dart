import 'package:dio/dio.dart';
import 'package:mobile_challenge/modules/login/domain/entities/clinic_entity.dart';
import 'package:mobile_challenge/modules/login/infra/dtos/clinic_dto.dart';

import '../infra/datasources/i_home_datasource.dart';

class HomeDatasource implements IHomeDatasource {
  final Dio _dio;
  HomeDatasource(this._dio);

  @override
  Future<List<ClinicEntity>> call(int pageNumber) async {
    var clinics = <ClinicEntity>[];

    final response = await _dio.get(
      'https://apihml.drcash.com.br/api/v1/clinics/public',
      queryParameters: {
        'pageNumber': pageNumber,
        'pageSize': '1646',
        'orderBy': '',
        'city': '',
        'state': '',
      },
    );

    (response.data['data'] as List).map((c) {
      final clinic = ClinicDto.fromJson(c);
      clinics.add(clinic);
    }).toList();

    return clinics;
  }
}
