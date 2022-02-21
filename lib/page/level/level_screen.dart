import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/widgets/app_bar.dart';

class LevelScreen extends StatelessWidget {
  static const routeName = '/levelScreen';
  const LevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusbar_height = MediaQuery.of(context).padding.top;
    List<Level> level = Get.arguments;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusbar_height),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            AppBarWidget(),
            Expanded(
              child: Container(
                  child: Center(
                      child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(level.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(GradeScreen.routeName,
                          arguments: level[index].grade);
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
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
                          level[index].levelName.toString(),
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                }),
              ))),
            )
          ],
        ),
      ),
    );
  }
}
