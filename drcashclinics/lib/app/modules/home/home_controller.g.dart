// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$homeModelListAtom =
      Atom(name: 'HomeControllerBase.homeModelList', context: context);

  @override
  List<HomeModel> get homeModelList {
    _$homeModelListAtom.reportRead();
    return super.homeModelList;
  }

  @override
  set homeModelList(List<HomeModel> value) {
    _$homeModelListAtom.reportWrite(value, super.homeModelList, () {
      super.homeModelList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerBase.isLoading', context: context);

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

  late final _$favoriteClinicAtom =
      Atom(name: 'HomeControllerBase.favoriteClinic', context: context);

  @override
  Set<HomeModel> get favoriteClinic {
    _$favoriteClinicAtom.reportRead();
    return super.favoriteClinic;
  }

  @override
  set favoriteClinic(Set<HomeModel> value) {
    _$favoriteClinicAtom.reportWrite(value, super.favoriteClinic, () {
      super.favoriteClinic = value;
    });
  }

  late final _$obscureIconAtom =
      Atom(name: 'HomeControllerBase.obscureIcon', context: context);

  @override
  IconData get obscureIcon {
    _$obscureIconAtom.reportRead();
    return super.obscureIcon;
  }

  @override
  set obscureIcon(IconData value) {
    _$obscureIconAtom.reportWrite(value, super.obscureIcon, () {
      super.obscureIcon = value;
    });
  }

  late final _$getClinicsAsyncAction =
      AsyncAction('HomeControllerBase.getClinics', context: context);

  @override
  Future getClinics() {
    return _$getClinicsAsyncAction.run(() => super.getClinics());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  dynamic changeIsLoading() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  IconData getIconByClinicType(String clinicType) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.getIconByClinicType');
    try {
      return super.getIconByClinicType(clinicType);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFavorite(HomeModel homeModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.addFavorite');
    try {
      return super.addFavorite(homeModel);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isFavorited(HomeModel homeModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.isFavorited');
    try {
      return super.isFavorited(homeModel);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
homeModelList: ${homeModelList},
isLoading: ${isLoading},
favoriteClinic: ${favoriteClinic},
obscureIcon: ${obscureIcon}
    ''';
  }
}
