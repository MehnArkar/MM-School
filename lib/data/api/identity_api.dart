import 'package:get/get.dart';

class IdentityApi extends GetConnect implements GetxService {
  final String appBaseUrl;
  IdentityApi({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
  }

  Future<Response> getIdentity(String name, String email, String grade) async {
    try {
      Response response = await get(
          'studata.php?gdata=Grade-$grade&name=$name&mail=$email&fbclid=IwAR0oEwn3lYbF_v5jMK73_RkjqZtkcAHHtxl5KG0ec0Xi2h6JiRTXhAg6uRk');
      return response;
    } catch (error) {
      return Response(statusCode: 1, statusText: error.toString());
    }
  }
}
