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
}
