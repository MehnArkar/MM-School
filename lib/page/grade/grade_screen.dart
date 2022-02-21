import 'package:flutter/material.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:get/get.dart';
import 'package:mm_school/page/subject/subject_screen.dart';
import 'package:mm_school/page/widgets/app_bar.dart';

class GradeScreen extends StatelessWidget {
  static const routeName = '/gradeScreen';
  const GradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusbar_height = MediaQuery.of(context).padding.top;
    List<Grade> gradeList = Get.arguments;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: EdgeInsets.only(top: statusbar_height),
        child: Column(
          children: [
            AppBarWidget(),
            Expanded(
                child: Container(
              child: ListView.builder(
                  itemCount: gradeList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(SubjectScreen.routeName,
                            arguments: gradeList[index].sub);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: double.maxFinite,
                        height: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.redAccent, width: 1.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Center(
                          child: Text(
                            gradeList[index].gradeName.toString(),
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    );
                  })),
            ))
          ],
        ),
      ),
    );
  }
}
