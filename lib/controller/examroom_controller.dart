import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mm_school/data/repository/exam_repository.dart';
import 'package:mm_school/model/exam_model.dart';

class ExamRoomController extends GetxController {
  ExamModel examModel = ExamModel(examStudent: []);
  ExamRepo examRepo;
  ExamRoomController({required this.examRepo});

  bool isLoaded = false;

  //Get zoom class student
  Future<void> getZoomStudent(String year, String name, String sectionName,
      String sectionNumber, String grade) async {
    isLoaded = true;
    update();
    http.Response response = await examRepo.getZoomStudent(
        year, name, sectionName, sectionNumber, grade);
    if (response.statusCode == 200) {
      examModel = ExamModel.fromJson(jsonDecode(response.body));
      await Future.delayed(const Duration(seconds: 1));
      isLoaded = false;
    } else {
      print(response.statusCode);
    }
    update();
  }

  //Get E class student
  Future<void> getEclassStudent(String year, String mail, String grade) async {
    print('load data');
    isLoaded = true;
    update();
    http.Response response = await examRepo.getEclassStudent(year, mail, grade);
    if (response.statusCode == 200) {
      examModel = ExamModel.fromJson(jsonDecode(response.body));
      await Future.delayed(const Duration(seconds: 1));
      isLoaded = false;
    } else {
      print(response.statusCode);
    }
    update();
  }
}
