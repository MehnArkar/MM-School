import 'dart:convert';

import 'package:get/get.dart';
import 'package:mm_school/data/repository/eclass_repository.dart';
import 'package:mm_school/model/eclass_model.dart';

class EclassController extends GetxController {
  EclassModel lessonModel = EclassModel(eclassData: []);
  EclassModel assessmentModel = EclassModel(eclassData: []);
  EClassRepo eClassRepo;
  EclassController({required this.eClassRepo});

  bool isLoaded = false;
  String? batch;
  String? grade;

  Future<void> getEclassData(String grade, String batch, String lesson) async {
    Response response = await eClassRepo.getEclassData(grade, batch, lesson);
    if (response.statusCode == 200) {
      if (lesson == 'Lesson') {
        lessonModel = EclassModel.fromJson(jsonDecode(response.body));
        isLoaded = true;
      } else if (lesson == 'Assessment') {
        assessmentModel = EclassModel.fromJson(jsonDecode(response.body));
        isLoaded = true;
      }
    } else {
      print(response.statusCode);
    }
    update();
  }

  void setBatch(String batch) {
    this.batch = batch;
  }

  void setGrade(String grade) {
    this.grade = grade;
  }
}
