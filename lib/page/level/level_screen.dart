import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/widgets/app_bar.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/colors.dart';

class LevelScreen extends StatefulWidget {
  static const routeName = '/levelScreen';
  const LevelScreen({Key? key}) : super(key: key);

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  DialogController dialogController = Get.find<DialogController>();

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
                      await Get.toNamed(GradeScreen.routeName,
                          arguments: level[index].grade);
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          border:
                              Border.all(color: Colors.redAccent, width: 1.5),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Center(
                        child: Text(
                          level[index].levelName.toString(),
                          style: TextStyle(
                              color: Colors.white,
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
