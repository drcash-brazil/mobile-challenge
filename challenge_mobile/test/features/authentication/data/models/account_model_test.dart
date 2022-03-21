import 'dart:convert';

import 'package:challenge_mobile/app/features/authentication/data/models/account_model.dart';
import 'package:challenge_mobile/app/features/authentication/domain/entities/account_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture.dart';

void main() {
  final accountModel = AcccountModel(
    tokenType: "bearer",
    refreshToken: "refresh_token",
    accessToken: "accessTokenExample",
    expiresIn: 1647532840,
  );

  test("espero que retorne uma subclass de AccountEntity", () async {
    expect(accountModel, isA<AccountEntity>());
  });

  group("accountModel FromJson", () {
    test("espero que retorne um json valido quando efetuar a requisição", () {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture("account_model.json"));
      final result = AcccountModel.fromJson(jsonMap);

      expect(result, accountModel);
    });
  });
}
