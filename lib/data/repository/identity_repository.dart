import 'package:get/get.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:mm_school/data/api/eclass_api_client.dart';
import 'package:mm_school/data/api/identity_api.dart';
import 'package:mm_school/utils/constant.dart';

class IdentityRepo extends GetxService {
  final IdentityApi apiClient;
  IdentityRepo({required this.apiClient});

  Future<Response> getIdentityData(
      String name, String email, String grade) async {
    return await apiClient.getIdentity(name, email, grade);
  }
}
