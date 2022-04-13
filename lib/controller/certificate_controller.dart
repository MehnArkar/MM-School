import 'dart:convert';
import 'package:get/get.dart';
import 'package:mm_school/data/repository/certificate_responsitory.dart';
import 'package:http/http.dart' as http;
import 'package:mm_school/model/student_model.dart';

class CertificateController extends GetxController {
  StudentModel studentModel = StudentModel(student: []);
  CertificateRepo certificateRepo;
  CertificateController({required this.certificateRepo});

  bool isLoaded = false;

  //Get Zoom class certifite
  Future<void> getCertifyStudent(String year, String name, String sectionName,
      String sectionNumber, String grade) async {
    isLoaded = true;
    update();
    http.Response response = await certificateRepo.getCertifyStudent(
        year, name, sectionName, sectionNumber, grade);
    if (response.statusCode == 200) {
      studentModel = StudentModel.fromJson(jsonDecode(response.body));
      await Future.delayed(const Duration(seconds: 1));
      isLoaded = false;
    } else {
      print(response.statusCode);
    }
    update();
  }

  //Get E-classes certificate

  Future<void> getEClassCertifyStudent(String id) async {
    isLoaded = true;
    update();
    http.Response response = await certificateRepo.getEClassCertifyStudent(id);
    if (response.statusCode == 200) {
      studentModel = StudentModel.fromJson(jsonDecode(response.body));
      isLoaded = false;
    } else {
      print(response.statusCode);
    }
    update();
  }
}
