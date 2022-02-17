import 'package:dio/dio.dart';
import 'package:poccash/app/shared/core/constants/constants.dart';
import 'package:poccash/app/shared/models/response/clinic_response_model.dart';
import 'package:poccash/app/shared/repositories/interfaces/i_clinic_repository.dart';
import 'package:poccash/app/shared/webclient/webclient.dart';

class ClinicRepository extends IClinicRepository {
  final WebClient? _client;
  ClinicRepository(
    this._client,
  );

  @override
  Future<ClinicResponseModel?> getClinics() async {
    try {
      //na url deixei cravado o pagesize, somente para trazer os 20 primeiros.
      Response<dynamic> response = await _client!.get(
        urlClinics,
      );

      return ClinicResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    } catch (e) {
      rethrow;
    }
  }
}
