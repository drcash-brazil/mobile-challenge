// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinics_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClinicsStore on _ClinicsStoreBase, Store {
  final _$clinicsAtom = Atom(name: '_ClinicsStoreBase.clinics');

  @override
  List<ClinicsModel> get clinics {
    _$clinicsAtom.reportRead();
    return super.clinics;
  }

  @override
  set clinics(List<ClinicsModel> value) {
    _$clinicsAtom.reportWrite(value, super.clinics, () {
      super.clinics = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ClinicsStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  @override
  String toString() {
    return '''
clinics: ${clinics},
isLoading: ${isLoading}
    ''';
  }
}
