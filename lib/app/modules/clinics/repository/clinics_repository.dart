import 'package:dr_cash_clinic/app/modules/clinics/models/remote_clinics_details_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class ClinicsRepository {
  int currentPage = 1;

  late int pageNumber;

  List<Datum> clinics = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getClinicsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= pageNumber) {
        refreshController.loadNoData();
        return false;
      }
    }

    final Uri uri = Uri.parse(
        "https://apihml.drcash.com.br/api/v1/clinics/public?pageNumber=$currentPage");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = RemoteClinicsDetailsModelFromJson(response.body);

      if (isRefresh) {
        clinics = result.data;
      } else {
        clinics.addAll(result.data);
      }

      currentPage++;

      pageNumber = result.pageNumber;

      print(response.body);
      return true;
    } else {
      return false;
    }
  }
}
