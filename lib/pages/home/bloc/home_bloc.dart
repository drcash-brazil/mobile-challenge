import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_challenge_drcash/model/clinics_model.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_event.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_state.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_exception.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_services.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ClinicsService clinicsService;

  HomeBloc({required this.clinicsService}) : super(LoadingState()) {
    on<LoadOnInitEvent>((event, emit) => _loadOnInit(event, emit));
    on<LoadMoreClinicsEvent>((event, emit) => _loadMoreClinics(event, emit));

    add(LoadOnInitEvent());
  }

  void _loadOnInit(LoadOnInitEvent event, Emitter<HomeState> emit) async {
    try {
      List<ClinicsDetails> listClinics =
          await clinicsService.getClinics(page: 1);
      int pageNumber = 2;
      emit(LoadingState(listClinics: listClinics, page: pageNumber));
      emit(HomeState(listClinics: listClinics, page: pageNumber));
    } on ClinicsException catch (e) {
      emit(ErrorState(
          listClinics: state.listClinics,
          page: state.page,
          errorMessage: e.errorMessage));
    } catch (e) {
      emit(ErrorState(
          listClinics: state.listClinics,
          page: state.page,
          errorMessage: "Unexpected error, try later..."));
    }
  }

  void _loadMoreClinics(
      LoadMoreClinicsEvent event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingNewClinicsState(
          listClinics: state.listClinics, page: state.page));

      List<ClinicsDetails> listClinicsNew =
          await clinicsService.getClinics(page: state.page!);

      List<ClinicsDetails>? listClinicsAtual = state.listClinics;

      int pageNumber = state.page! + 1;
      for (var i = 0; i < listClinicsNew.length; i++) {
        listClinicsAtual!.add(listClinicsNew[i]);
      }

      emit(HomeState(listClinics: listClinicsAtual, page: pageNumber));
    } on ClinicsException catch (e) {
      emit(ErrorState(
          listClinics: state.listClinics,
          page: state.page,
          errorMessage: e.errorMessage));
    } catch (e) {
      emit(ErrorState(
          listClinics: state.listClinics,
          page: state.page,
          errorMessage: "Um erro inesperado aconteceu, tente novamente..."));
    }
  }
}
