import 'dart:convert';

import 'package:get/get.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final DataRepo dataRepo;
  AuthController({required this.dataRepo});
  RxBool _isLoaded = false.obs;
  RxBool get isLoaded => _isLoaded;

  Future<String> signUpUser(
      name, nName, email, accType, password, deviceID) async {
    _isLoaded.value = true;
    http.Response response = await dataRepo.signUpUser(
        name, nName, email, accType, password, deviceID);
    if (response.statusCode == 200) {
      _isLoaded.value = false;
      String message = jsonDecode(response.body)["msg"];

      if (message == "We sent OTP verification code to $email") {
        return "success";
      } else if (message == "$email is already exist!") {
        return "exist";
      } else {
        return "error";
      }
    } else {
      _isLoaded.value = false;
      return 'error';
    }
  }

  Future<String> verifyOTP(email, pin) async {
    _isLoaded.value = true;
    http.Response response = await dataRepo.verifyOTP(email, pin);
    if (response.statusCode == 200) {
      _isLoaded.value = false;
      String message = jsonDecode(response.body)["msg"];

      if (message == "Success") {
        return "success";
      } else {
        return "error";
      }
    } else {
      _isLoaded.value = false;
      return 'error';
    }
  }
}

//We sent OTP verification code to testing1@gmail.com
//testing1@gmail.com is already exist!