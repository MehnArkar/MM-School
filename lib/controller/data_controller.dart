import 'dart:convert';

import 'package:get/get.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  final DataRepo dataRepo;
  DataController({required this.dataRepo});
  Datamodel datamodel = Datamodel();

  RxBool _isLoaded = false.obs;
  RxBool get isLoaded => _isLoaded;

  Future<void> getData() async {
    http.Response response = await dataRepo.getHttpData();
    if (response.statusCode == 200) {
      datamodel = Datamodel.fromJson(jsonDecode(response.body));
      _isLoaded.value = true;
      print('got data');
      update();
    } else {
      print("error in fetching data");
    }
  }

  Future<void> checkAds() async {
    if (isLoaded.value) {
      Get.offAndToNamed(HomeScreen.routeName);
    }
  }
}
