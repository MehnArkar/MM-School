import 'package:get/get.dart';
import 'package:mm_school/data/api/certificate_api.dart';
import 'package:http/http.dart' as http;

class CertificateRepo extends GetxService {
  final CertificateApi apiClient;
  CertificateRepo({required this.apiClient});

  Future<http.Response> getCertifyStudent(String year, String name,
      String sectionName, String sectionNumber, String grade) async {
    return await apiClient.getCertifyStudent(
        year, name, sectionName, sectionNumber, grade);
  }

  Future<http.Response> getEClassCertifyStudent(String id) async {
    return await apiClient.getEClassCertifyStudent(id);
  }
}
