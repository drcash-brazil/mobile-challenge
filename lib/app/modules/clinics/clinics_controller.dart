import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:mobile_challenge/app/core/mixins/loader_mixin.dart';
import 'package:mobile_challenge/app/core/mixins/messages_mixin.dart';
import 'package:mobile_challenge/app/core/rest_client/api_response.dart';
import 'package:mobile_challenge/app/data/model/clicnic_model.dart';
import 'package:mobile_challenge/app/data/repository/clinics/clinics_repository.dart';

class ClinicsController extends GetxController
    with LoaderMixin, MessagesMixin, SingleGetTickerProviderMixin {
  final ClinicsRepository? _clinicsRepository;
  AnimationController? animationController;
  final Duration duration = const Duration(milliseconds: 1000);

  //observables
  final clinics = <ClinicModel>[].obs;
  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();
  final isAnimation = false.obs;


  ClinicsController({required ClinicsRepository clinicsRepository})
      : _clinicsRepository = clinicsRepository;

  @override
  void onInit() async {
    animationController = AnimationController(vsync: this, duration: duration);

    super.onInit();
  }

  @override
  void onReady() {
    loaderListener(_isLoading);
    messageListener(_message);
    getClinics();
    super.onReady();
  }

  void refreshPage() {
    animationController!.reset();
    this.getClinics();  
  }
  void getClinics() async {
    _isLoading.value = true;
    ApiResponse<List<ClinicModel>> response =
        await _clinicsRepository!.getClinics();
    if (response.ok!) {
      clinics.value = response.result!;
      handlerAnimation();
    } else {
      _message(MessageModel(
          title: 'Erro', message: response.msg!, type: MessageType.error));
    }
    _isLoading.value = false;
  }

  handlerAnimation() {
    isAnimation.value = true;
    animationController!.forward().whenComplete(() {
      animationController?.stop();
      animationController?.dispose();
    });
  }
}
