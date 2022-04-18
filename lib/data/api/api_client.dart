import 'package:http/http.dart' as http;
import 'package:mm_school/utils/constant.dart';

class ApiClient {
  final String appBaseUrl;
  ApiClient({required this.appBaseUrl});

  Future<http.Response> getHttpData() async {
    http.Response response = await http
        .get(Uri.parse(appBaseUrl + AppConstant.API_URL))
        .timeout(const Duration(seconds: 30));

    return response;
  }

  //Sign up
  Future<http.Response> signUpUser(String name, String nName, String email,
      String accType, String password, String deviceID) async {
    http.Response response = await http
        .get(Uri.parse(AppConstant.SIGN_UP_BASE_URL +
            'register.php?fname=$name&nname=$nName&email=$email&password=$password&acctype=$accType&devid=$deviceID'))
        .timeout(const Duration(seconds: 30));

    return response;
  }

  //Verify OTP
  Future<http.Response> verifyOTP(String email, String pin) async {
    http.Response response = await http
        .get(Uri.parse(
            AppConstant.SIGN_UP_BASE_URL + "otp.php?mail=$email&pin=$pin"))
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
