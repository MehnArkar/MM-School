import 'dart:convert';

import 'package:get/get.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/model/eclass_model.dart';
import 'package:mm_school/page/home/home_screen.dart';

class DataController extends GetxController {
  final DataRepo dataRepo;
  DataController({required this.dataRepo});
  Datamodel datamodel = Datamodel();

  RxBool _isLoaded = false.obs;
  RxBool get isLoaded => _isLoaded;

  Future<void> getData() async {
    Response response = await dataRepo.getData();
    if (response.statusCode == 200) {
      datamodel = Datamodel.fromJson(response.body);
      _isLoaded.value = true;
      update();
    } else {
      print(response.statusCode);
    }
  }

  Future<void> checkAds() async {
    if (isLoaded.value) {
      Get.offAndToNamed(HomeScreen.routeName);
    }
  }
}
