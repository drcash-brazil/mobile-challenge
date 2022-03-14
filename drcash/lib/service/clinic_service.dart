import 'dart:convert';

import 'package:drcash/base/base_url.dart';
import 'package:drcash/model/clinic.dart';
import 'package:http/http.dart' as http;

class ClinicService {
  Future<List<Clinic>> all() async {
    print("all");
    final response = await http.get(
      Uri.parse(BaseURL.urlClinic),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['data'] as List)
          .map((json) => Clinic.fromJson(json))
          .toList();
    } else {
      return null;
    }
  }

  Future<List<Clinic>> clinicCity(String city) async {
    print("city");
    final response = await http.get(
      Uri.parse(BaseURL.urlClinic + "?city=" + city),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['data'] as List)
          .map((json) => Clinic.fromJson(json))
          .toList();
    } else {
      return null;
    }
  }

  Future<List<Clinic>> clinicState(String state) async {
    print("uf");
    final response = await http.get(
      Uri.parse(BaseURL.urlClinic + "?state=" + state),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['data'] as List)
          .map((json) => Clinic.fromJson(json))
          .toList();
    } else {
      return null;
    }
  }
}
