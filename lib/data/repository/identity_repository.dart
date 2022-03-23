import 'package:get/get.dart';
import 'package:mm_school/data/api/identity_api.dart';
import 'package:http/http.dart' as http;

class IdentityRepo extends GetxService {
  final IdentityApi apiClient;
  IdentityRepo({required this.apiClient});

  Future<http.Response> getIdentityData(
      String name, String email, String grade) async {
    return await apiClient.getIdentity(name, email, grade);
  }
}
