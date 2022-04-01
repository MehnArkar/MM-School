import 'dart:convert';
import 'package:get/get.dart';
import 'package:mm_school/data/repository/checkID_repository.dart';
import 'package:mm_school/model/id_model.dart';
import 'package:http/http.dart' as http;

class CheckIdController extends GetxController {
  IdModel idModel = IdModel(id: []);
  CheckIdRepo checkIdRepo;
  CheckIdController({required this.checkIdRepo});

  bool isLoaded = false;

  Future<void> getIdentity(String id) async {
    isLoaded = true;
    update();
    http.Response response = await checkIdRepo.getIdentity(id);
    if (response.statusCode == 200) {
      idModel = IdModel.fromJson(jsonDecode(response.body));
      await Future.delayed(const Duration(seconds: 1));
      isLoaded = false;
    } else {
      print(response.statusCode);
    }
    update();
  }
}
