import 'package:get/get.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:http/http.dart' as http;

class DataRepo extends GetxService {
  final ApiClient apiClient;
  DataRepo({required this.apiClient});

  Future<http.Response> getHttpData() async {
    return await apiClient.getHttpData();
  }
}
