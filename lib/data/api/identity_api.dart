import 'package:http/http.dart' as http;

class IdentityApi {
  final String appBaseUrl;
  IdentityApi({required this.appBaseUrl});

  Future<http.Response> getIdentity(
      String name, String email, String grade) async {
    http.Response response = await http.get(Uri.parse(
        '${appBaseUrl}studata.php?gdata=Grade-$grade&name=$name&mail=$email&fbclid=IwAR0oEwn3lYbF_v5jMK73_RkjqZtkcAHHtxl5KG0ec0Xi2h6JiRTXhAg6uRk'));
    return response;
  }
}
