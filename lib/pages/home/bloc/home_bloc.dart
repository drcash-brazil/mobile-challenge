import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_event.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_state.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_services.dart';
import 'package:mobile_challenge_drcash/services/session/session_exception.dart';
import 'package:mobile_challenge_drcash/services/session/session_response.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ClinicsService clinicsService;

  HomeBloc({required this.clinicsService}) : super(HomeState()) {
    on<LoadOnInitEvent>((event, emit) => _loadOnInit(event, emit));

    add(LoadOnInitEvent());
  }

  void _loadOnInit(LoadOnInitEvent event, Emitter<HomeState> emit) async {
    await clinicsService.getClinics(page: 1);
    emit(HomeState());
  }
}
