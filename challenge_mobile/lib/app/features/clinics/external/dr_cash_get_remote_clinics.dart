// ignore_for_file: missing_return

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/params/clinic_params.dart';
import '../data/datasources/remote_get_clinics_datasource.dart';
import '../data/models/clinic_model.dart';

class DrCashGetRemoteClinics extends ChangeNotifier
    implements RemoteGetClinicDataSource {
  final Dio dio;
  String errorMessage = "";

  DrCashGetRemoteClinics(this.dio);

  @override
  Future<List<ClinicModel>> getClinics(ClinicParams params) async {
    try {
      final response = await dio.get(
          "https://apihml.drcash.com.br/api/v1/clinics/public",
          queryParameters: {
            "pageNumber": params.pageNumber,
            "pageSize": params.pageSize,
            "orderBy": params.orderBy,
            "city": params.city,
            "state": params.city
          });

      if (response.statusCode == 200) {
        final data = (response.data["data"] as List)
            .map((dynamic e) => e as Map<String, dynamic>)
            .toList();

        return data.map((e) => ClinicModel.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      print("DIO ERROR: ${e.response.data.toString()}");
    }
  }
}
