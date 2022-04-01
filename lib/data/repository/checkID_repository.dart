import 'package:get/get.dart';
import 'package:mm_school/data/api/checkID_api.dart';
import 'package:http/http.dart' as http;

class CheckIdRepo extends GetxService {
  final CheckIdApi apiClient;
  CheckIdRepo({required this.apiClient});

  Future<http.Response> getIdentity(String id) async {
    return await apiClient.checkIdentity(id);
  }
}
