import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/page/lesson/lesson_screen.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';

class EclassGrade extends StatefulWidget {
  static const routeName = '/eclassGradeScreen';
  const EclassGrade({Key? key}) : super(key: key);

  @override
  State<EclassGrade> createState() => _EclassGradeState();
}

class _EclassGradeState extends State<EclassGrade> {
  EclassController eclassController = Get.find();
  DialogController dialogController = Get.find<DialogController>();

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
          children: List.generate(10, (index) {
            String grade;
            if (index < 4) {
              grade = (index + 1).toString();
            } else {
              grade = (index + 2).toString();
            }
            return GestureDetector(
              onTap: () async {
                dialogController.setTime();
                await Get.find<AdController>()
                    .loadAd(AppConstant.FOURTH_AD_UNIT, null);
                dialogController.startTimer();
                await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimension.height20)),
                        child: TimerDialog(),
                      );
                    });
                await Get.find<AdController>()
                    .showAds(AppConstant.FOURTH_AD_UNIT);

                if (grade.length == 1) {
                  eclassController.setGrade("0$grade");
                } else if (grade.length == 2) {
                  eclassController.setGrade(grade);
                }

                await Get.toNamed(LessonScreen.routeName, arguments: grade);
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimension.height15),
                      child: Image.asset('assets/img/$grade.jpg',
                          fit: BoxFit.fill)),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
