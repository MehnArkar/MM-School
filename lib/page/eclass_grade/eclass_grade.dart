import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/page/lesson/lesson_screen.dart';
import 'package:mm_school/utils/dimension.dart';

class EclassGrade extends StatefulWidget {
  static const routeName = '/eclassGradeScreen';
  const EclassGrade({Key? key}) : super(key: key);

  @override
  State<EclassGrade> createState() => _EclassGradeState();
}

class _EclassGradeState extends State<EclassGrade> {
  EclassController eclassController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title:
            const Text('Grades', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Container(
              margin: EdgeInsets.only(right: Dimension.height10),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/img/circle.png',
                fit: BoxFit.fill,
              ))
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: GridView.count(
          childAspectRatio: 1,
          primary: false,
          crossAxisSpacing: Dimension.height20,
          mainAxisSpacing: Dimension.height20,
          padding: EdgeInsets.only(
            left: Dimension.height20,
            right: Dimension.height20,
            bottom: Dimension.height20,
            top: Dimension.height20,
          ),
          crossAxisCount: 2,
          children: List.generate(11, (index) {
            return GestureDetector(
              onTap: () {
                if ((index + 1).toString().length == 1) {
                  eclassController.setGrade("0" + (index + 1).toString());
                } else if ((index + 1).toString().length == 2) {
                  eclassController.setGrade((index + 1).toString());
                }
                Get.toNamed(LessonScreen.routeName,
                    arguments: (index + 1).toString());
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      offset: const Offset(0, 5),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      offset: const Offset(0, 1),
                      blurRadius: 3,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.height15),
                ),
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Dimension.height50,
                          height: Dimension.height50,
                          child: Image.asset('assets/img/education.png',
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: Dimension.height10,
                        ),
                        Text(
                          "Grade - " + (index + 1).toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'RobotoCondensed',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
