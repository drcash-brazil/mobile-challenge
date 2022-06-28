import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/home/clinics_list.dart';
import '../../models/user_data.dart';

class HomeDTO extends ChangeNotifier {
  Future<List<ClinicData>> getClinic(int pageNumber, int pageSize, String orderBy,
      String city, String state) async {
    final queryParameters = <String, dynamic>{
      "pageNumber": pageNumber,
      "pageSize": pageSize,
      "orderBy": orderBy,
      "city": city,
      "state": state,
    };
    var uri = Uri.http('apihml.drcash.com.br',
        '/api/v1/clinics/public', queryParameters.map((key, value) => MapEntry(key, value.toString())));
    final response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'] as List;
      print(response.body);
      return data.map((item) => ClinicData.fromJson(item)).toList();
    } else {
      print(response.body);
      throw Exception('Failed to load cliente');
    }
  }
}
