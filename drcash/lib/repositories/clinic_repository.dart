import 'package:dio/dio.dart';
import 'package:drcash/core/endpoints.dart';
import 'package:drcash/core/shared_preference_helper.dart';
import 'package:drcash/models/clinic_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'clinic_repository_interface.dart';

class ClinicRepository implements IClinicRepository {
  final Dio _dio;
  ClinicRepository(this._dio);

  @override
  Future<ClinicResponse?> getList(int page) async {
    final response = await _dio.get(
      Endpoints.clinics,
      queryParameters: {
        'pageSize': 2,
        'pageNumber': page,
      },
      options: Options(
        headers: {'Authorization': 'Bearer ${_getToken()}'},
      ),
    );
    return ClinicResponse.fromJson(response.data);
  }

  _getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return SharedPreferenceHelper(prefs).authToken;
  }
}
