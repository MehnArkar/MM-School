import 'package:http/http.dart' as http;

class CheckIdApi {
  final String baseUrl;
  CheckIdApi({required this.baseUrl});

  Future<http.Response> checkIdentity(String id) async {
    http.Response response = await http.get(Uri.parse('${baseUrl}?stuid=$id'));
    return response;
  }
}
