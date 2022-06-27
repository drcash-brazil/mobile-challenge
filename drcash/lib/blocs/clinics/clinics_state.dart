part of 'clinics_cubit.dart';

@immutable
class ClinicsState {
  final ClinicResponse? response;
  final bool? loading;
  final dynamic error;

  const ClinicsState({
    this.response,
    this.loading,
    this.error,
  });

  ClinicsState copyWith({
    ClinicResponse? response,
    bool? loading,
    dynamic error,
  }) {
    return ClinicsState(
      response: response ?? this.response,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
