import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Failure extends Equatable {
  final String message;
  const Failure({@required this.message});
  @override
  List<Object> get props => [message];
}

class RemoteAuthenticationDataSourceError extends Failure {
  final String message;
  const RemoteAuthenticationDataSourceError(this.message);
}

class RemoteGetClinicsDataSourceError extends Failure {
  final String message;
  const RemoteGetClinicsDataSourceError(this.message);
}
