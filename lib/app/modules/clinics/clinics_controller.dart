import 'package:get/get.dart';
import 'package:mobile_challenge/app/core/mixins/loader_mixin.dart';
import 'package:mobile_challenge/app/core/mixins/messages_mixin.dart';
import 'package:mobile_challenge/app/core/rest_client/api_response.dart';
import 'package:mobile_challenge/app/data/model/clicnic_model.dart';
import 'package:mobile_challenge/app/data/repository/clinics/clinics_repository.dart';

class ClinicsController extends GetxController with LoaderMixin, MessagesMixin{
  final ClinicsRepository? _clinicsRepository;

  //observables
  final clinics = <ClinicModel>[].obs;
  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();

  ClinicsController({required ClinicsRepository clinicsRepository}) : _clinicsRepository = clinicsRepository;

  @override
  void onInit() {
    loaderListener(_isLoading);
    messageListener(_message);
    getClinics();
    super.onInit();
  }

  void getClinics() async {
    _isLoading.value = true; 
    ApiResponse<List<ClinicModel>> response = await _clinicsRepository!.getClinics();
    if(response.ok!) {
      clinics.value = response.result!;
    } else {
      _message(
        MessageModel(title: 'Erro', message: response.msg!, type: MessageType.error)
      );
    }
    _isLoading.value = false;
  }
}