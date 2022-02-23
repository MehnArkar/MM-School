import 'package:flutter/material.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:get/get.dart';
import 'package:mm_school/page/subject/subject_screen.dart';
import 'package:mm_school/page/widgets/app_bar.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';

class GradeScreen extends StatelessWidget {
  static const routeName = '/gradeScreen';
  const GradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DialogController dialogController = Get.find();
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
                      onTap: () async {
                        dialogController.startTimer();
                        await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: TimerDialog(),
                              );
                            });

                        await showAds(null);
                        await Get.toNamed(SubjectScreen.routeName,
                            arguments: gradeList[index].sub);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: double.maxFinite,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            border:
                                Border.all(color: Colors.redAccent, width: 1.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Center(
                          child: Text(
                            gradeList[index].gradeName.toString(),
                            style: TextStyle(
                                color: Colors.white,
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
