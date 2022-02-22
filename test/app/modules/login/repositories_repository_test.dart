import 'package:flutter_test/flutter_test.dart';
import 'package:dr_cash_clinic/app/modules/login/repositories_repository.dart';
 
void main() {
  late RepositoriesRepository repository;

  setUpAll(() {
    repository = RepositoriesRepository();
  });
}