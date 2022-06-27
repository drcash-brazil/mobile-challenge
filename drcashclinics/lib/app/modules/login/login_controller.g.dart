// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$obscureValueAtom =
      Atom(name: 'LoginControllerBase.obscureValue', context: context);

  @override
  bool get obscureValue {
    _$obscureValueAtom.reportRead();
    return super.obscureValue;
  }

  @override
  set obscureValue(bool value) {
    _$obscureValueAtom.reportWrite(value, super.obscureValue, () {
      super.obscureValue = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'LoginControllerBase.isLoading', context: context);

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

  late final _$obscureIconAtom =
      Atom(name: 'LoginControllerBase.obscureIcon', context: context);

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

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  dynamic changeObscure() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changeObscure');
    try {
      return super.changeObscure();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscureValue: ${obscureValue},
isLoading: ${isLoading},
obscureIcon: ${obscureIcon}
    ''';
  }
}
