import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mm_school/data/api/exam_api.dart';

class ExamRepo extends GetxService {
  final ExamApi apiClient;
  ExamRepo({required this.apiClient});

  Future<http.Response> getZoomStudent(String year, String name,
      String sectionName, String sectionNumber, String grade) async {
    return await apiClient.getZoomStudent(
        year, name, sectionName, sectionNumber, grade);
  }

  Future<http.Response> getEclassStudent(
      String year, String mail, String grade) async {
    return await apiClient.getEclassStudent(year, mail, grade);
  }
}
