// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$requestStateAtom = Atom(name: 'HomeStoreBase.requestState');

  @override
  RequestStateEnum get requestState {
    _$requestStateAtom.reportRead();
    return super.requestState;
  }

  @override
  set requestState(RequestStateEnum value) {
    _$requestStateAtom.reportWrite(value, super.requestState, () {
      super.requestState = value;
    });
  }

  final _$listClinicsAtom = Atom(name: 'HomeStoreBase.listClinics');

  @override
  List<ClinicDataResponseModel?> get listClinics {
    _$listClinicsAtom.reportRead();
    return super.listClinics;
  }

  @override
  set listClinics(List<ClinicDataResponseModel?> value) {
    _$listClinicsAtom.reportWrite(value, super.listClinics, () {
      super.listClinics = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('HomeStoreBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
requestState: ${requestState},
listClinics: ${listClinics}
    ''';
  }
}
