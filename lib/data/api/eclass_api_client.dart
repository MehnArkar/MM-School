import 'package:get/get.dart';

class EClassApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  EClassApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
  }

  Future<Response> getEclassData(
      String grade, String batch, String lesson) async {
    try {
      Response response = await get(
          '/classdata.php?gdata=Grade-$grade&les=$lesson&sec=$batch&fbclid=IwAR2z5voAzptaaf37C7KYMWI0gBrLN36KV896HgEWGUH7kODqz4pkSw_yKI0');
      return response;
    } catch (error) {
      return Response(statusCode: 1, statusText: error.toString());
    }
  }
}
