import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/home/clinics_list.dart';
import '../../models/user_data.dart';

class HomeDTO {
  Future<ClinicData> getClinic(int pageNumber,
   int pageSize,
   String orderBy,
   String city,
   String state) async {
    final response = await http.post(
      Uri.parse('https://apihml.drcash.com.br/api/v1/identity/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        "pageNumber":pageNumber,
        "pageSize": pageSize,
        "orderBy": orderBy,
        "city": city,
        "state": state,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return  ClinicData.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load cliente');
    }
  }
}
