import 'package:mobile_challenge_drcash/model/clinics_model.dart';

class HomeState {
  int? page = 1;
  List<ClinicsDetails>? listClinics = [];
  HomeState({this.listClinics, this.page});

  HomeState copyWith({List<ClinicsDetails>? email, int? page}) {
    return HomeState(
        listClinics: listClinics ?? this.listClinics, page: page ?? this.page);
  }
}

class LoadingState extends HomeState {
  LoadingState({List<ClinicsDetails>? listClinics, int? page})
      : super(listClinics: listClinics, page: page);
}

class LoadingNewClinicsState extends HomeState {
  LoadingNewClinicsState({List<ClinicsDetails>? listClinics, int? page})
      : super(listClinics: listClinics, page: page);
}

class ErrorState extends HomeState {
  final String? errorMessage;

  ErrorState({List<ClinicsDetails>? listClinics, int? page, this.errorMessage})
      : super(listClinics: listClinics, page: page);
}
