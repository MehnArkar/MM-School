import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/dimension.dart';

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
    List<Level> level = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text('Levels',
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
        ),
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
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
                                  borderRadius: BorderRadius.circular(
                                      Dimension.height20)),
                              child: TimerDialog(),
                            );
                          });

                      await showAds(null);
                      await Get.toNamed(GradeScreen.routeName,
                          arguments: level[index].grade);
                    },
                    child: Container(
                      padding: EdgeInsets.all(Dimension.height20),
                      margin: EdgeInsets.only(
                          top: Dimension.height10,
                          bottom: Dimension.height10,
                          left: Dimension.height20,
                          right: Dimension.height20),
                      width: double.maxFinite,
                      height: Dimension.height100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(color: Colors.lightBlue, width: 1),
                        borderRadius: BorderRadius.circular(Dimension.height15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            offset: const Offset(0, 7),
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            offset: const Offset(0, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                                width: Dimension.height60,
                                height: Dimension.height60,
                                child: Image.asset('assets/img/school-bag.png',
                                    fit: BoxFit.cover)),
                            SizedBox(
                              width: Dimension.height20,
                            ),
                            const VerticalDivider(
                              thickness: 2,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(
                              width: Dimension.height20,
                            ),
                            Text(
                              level[index].levelName.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )));
  }
}
