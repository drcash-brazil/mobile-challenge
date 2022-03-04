import 'dart:io';

import 'package:dr_cash_clinic/app/core/constants.dart';
import 'package:dr_cash_clinic/app/core/size_config.dart';
import 'package:dr_cash_clinic/app/modules/clinics/models/remote_clinics_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

// void main() {
//   HttpOverrides.global = MyHttpOverrides();

//   runApp(const MyApp());
// }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class ClinicsPage extends StatefulWidget {
  const ClinicsPage({Key? key}) : super(key: key);

  @override
  _ClinicsPageState createState() => _ClinicsPageState();
}

class _ClinicsPageState extends State<ClinicsPage> {
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
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  List<Datum> foundClinics = [];

  @override
  initState() {
    foundClinics = clinics;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Datum> results = [];
    if (enteredKeyword.isEmpty) {
      results = foundClinics;
      // .where(
      //     (clinic) => clinic.city.toLowerCase().contains(RegExp(r'[A-Z]')))
      // .toList();
    } else {
      results = clinics
          .where((clinic) => clinic.tradingName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      foundClinics = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Pesquisar Clinicas",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Pesquisar',
                  labelStyle: TextStyle(color: kPrimaryColor),
                  focusColor: kPrimaryColor,
                  suffixIcon: Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await getClinicsData(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await getClinicsData();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child: foundClinics.isNotEmpty
                    ? ListView.builder(
                        itemCount: foundClinics.length,
                        itemBuilder: (context, index) => Card(
                            key: ValueKey(foundClinics[index].id),
                            color: kPrimaryColor,
                            elevation: 4,
                            child: ListTile(
                              leading: FlutterLogo(
                                size: 30,
                              ),
                              title: Text(
                                foundClinics[index].tradingName,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${foundClinics[index].clinicType} ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet<Datum>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          color: kPrimaryColor,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  '${foundClinics[index].tradingName}',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${foundClinics[index].clinicType} ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${foundClinics[index].city} - ${foundClinics[index].state}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${foundClinics[index].phoneNumber}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${foundClinics[index].isActive}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                ElevatedButton(
                                                  child: const Text('Fechar'),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                              isThreeLine: true,
                            )),
                      )
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
