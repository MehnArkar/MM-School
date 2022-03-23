import 'package:http/http.dart' as http;

class EClassApiClient {
  final String appBaseUrl;
  EClassApiClient({required this.appBaseUrl});

  Future<http.Response> getEclassData(
      String grade, String batch, String lesson) async {
    http.Response response = await http.get(Uri.parse(
        '${appBaseUrl}/classdata.php?gdata=Grade-$grade&les=$lesson&sec=$batch&fbclid=IwAR2z5voAzptaaf37C7KYMWI0gBrLN36KV896HgEWGUH7kODqz4pkSw_yKI0'));
    return response;
  }
}
