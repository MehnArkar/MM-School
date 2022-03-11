import 'dart:convert';
import 'package:get/get.dart';
import 'package:mm_school/data/repository/identity_repository.dart';
import 'package:mm_school/model/identity_model.dart';

class IdentityController extends GetxController {
  IdentityModel identityModel = IdentityModel(identity: []);
  IdentityRepo identityRepo;
  IdentityController({required this.identityRepo});

  bool isLoaded = false;

  Future<void> getIdentityData(String name, String email, String grade) async {
    Response response = await identityRepo.getIdentityData(name, email, grade);
    if (response.statusCode == 200) {
      identityModel = IdentityModel.fromJson(jsonDecode(response.body));
      await Future.delayed(const Duration(seconds: 1));
      isLoaded = true;
    } else {
      print(response.statusCode);
    }
    update();
  }
}
