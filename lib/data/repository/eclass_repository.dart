import 'package:get/get.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:mm_school/data/api/eclass_api_client.dart';
import 'package:mm_school/utils/constant.dart';

class EClassRepo extends GetxService {
  final EClassApiClient apiClient;
  EClassRepo({required this.apiClient});

  Future<Response> getEclassData(
      String grade, String batch, String lesson) async {
    return await apiClient.getEclassData(grade, batch, lesson);
  }
}
