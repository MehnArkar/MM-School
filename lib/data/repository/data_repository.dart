import 'package:get/get.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:http/http.dart' as http;

class DataRepo extends GetxService {
  final ApiClient apiClient;
  DataRepo({required this.apiClient});

  Future<http.Response> getHttpData() async {
    return await apiClient.getHttpData();
  }

  //Sign up
  Future<http.Response> signUpUser(
      name, nName, email, accType, password, deviceID) async {
    return await apiClient.signUpUser(
        name, nName, email, accType, password, deviceID);
  }

  //Verify OTP
  Future<http.Response> verifyOTP(email, pin) async {
    return await apiClient.verifyOTP(email, pin);
  }

  Future<http.Response> logIn(String email, String pw) async {
    return await apiClient.logIn(email, pw);
  }
}
