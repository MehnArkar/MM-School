import 'package:flutter/material.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:get/get.dart';
import 'package:mm_school/model/eclass_model.dart';
import 'package:mm_school/page/lesson/assessment.dart';
import 'package:mm_school/page/lesson/lesson.dart';
import 'package:mm_school/utils/dimension.dart';

class LessonScreen extends StatefulWidget {
  static const routeName = '/lessonScreen';
  const LessonScreen({Key? key}) : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  EclassController eclassController = Get.find();

  @override
  void initState() {
    super.initState();
    String batch = eclassController.batch.toString();
    String grade = eclassController.grade.toString();
    eclassController.getEclassData(grade, batch, 'Lesson');
    eclassController.getEclassData(grade, batch, 'Assessment');
  }

  @override
  void dispose() {
    super.dispose();
    eclassController.isLoaded = false;
    eclassController.lessonModel = EclassModel(eclassData: []);
    eclassController.assessmentModel = EclassModel(eclassData: []);
  }

  @override
  Widget build(BuildContext context) {
    String grade = Get.arguments;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[400],
            title: Text('Grade - $grade',
                style: TextStyle(fontWeight: FontWeight.bold)),
            actions: [
              Container(
                  margin: EdgeInsets.only(right: Dimension.height10),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/img/circle.png',
                    fit: BoxFit.fill,
                  ))
            ],
            bottom: const TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                text: 'Lessons',
              ),
              Tab(
                text: 'Assessments',
              )
            ]),
          ),
          body: TabBarView(children: [Lesson(), Assessment()]),
        ));
  }
}

//TabBarView(children: [Lesson(), Assessment()])
