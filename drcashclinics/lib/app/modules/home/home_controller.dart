import 'package:drcashclinics/app/modules/home/home_model.dart';
import 'package:drcashclinics/app/modules/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final HomeRepository repository;
  HomeControllerBase(this.repository) {
    getClinics();
  }

  HomeModel homeModel = HomeModel();

  @observable
  List<HomeModel> homeModelList = [];

  @observable
  bool isLoading = true;

  @observable
  Set<HomeModel> favoriteClinic = <HomeModel>{};

  @observable
  IconData obscureIcon = Icons.visibility;

  @action
  changeIsLoading() => isLoading = !isLoading;

  @action
  getClinics() async {
    dynamic result = await repository.getClinics();

    if (result["statusCode"] == 200) {
      for (int i = 0; i < result["body"]["data"].length; i++) {
        homeModelList.add(HomeModel.fromJson(result["body"]["data"][i]));
      }
    }

    changeIsLoading();
  }

  @action
  IconData getIconByClinicType(String clinicType) {
    switch (clinicType) {
      case "Hospital":
        return FontAwesomeIcons.hospital;
      case "Estética geral":
        return FontAwesomeIcons.faceSmile;
      case "Odontologia":
        return FontAwesomeIcons.tooth;
      case "Cirurgia plástica":
        return FontAwesomeIcons.eyeDropper;
      default:
        return FontAwesomeIcons.hospital;
    }
  }

  @action
  addFavorite(HomeModel homeModel) {
    if (isFavorited(homeModel)) {
      favoriteClinic.remove(homeModel);
    } else {
      favoriteClinic.add(homeModel);
    }
  }

  @action
  bool isFavorited(HomeModel homeModel) {
    return favoriteClinic.contains(homeModel);
  }
}
