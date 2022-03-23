import 'package:get/get.dart';
import 'package:mm_school/data/api/eclass_api_client.dart';
import 'package:http/http.dart' as http;

class EClassRepo extends GetxService {
  final EClassApiClient apiClient;
  EClassRepo({required this.apiClient});

  Future<http.Response> getEclassData(
      String grade, String batch, String lesson) async {
    return await apiClient.getEclassData(grade, batch, lesson);
  }
}
