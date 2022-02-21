import 'package:get/get.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:mm_school/utils/constant.dart';

class DataRepo extends GetxService {
  final ApiClient apiClient;
  DataRepo({required this.apiClient});

  Future<Response> getData() async {
    return await apiClient.getData(AppConstant.API_URL);
  }
}
