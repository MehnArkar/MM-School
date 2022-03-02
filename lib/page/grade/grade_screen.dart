import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:get/get.dart';
import 'package:mm_school/page/subject/subject_screen.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/dimension.dart';

class GradeScreen extends StatefulWidget {
  static const routeName = '/gradeScreen';
  const GradeScreen({Key? key}) : super(key: key);

  @override
  State<GradeScreen> createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  DialogController dialogController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Grade> gradeList = Get.arguments;
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
          children: List.generate(gradeList.length, (index) {
            return GestureDetector(
              onTap: () async {
                dialogController.setTime();
                Get.find<AdController>()
                    .loadAd('ca-app-pub-1222451237037237/2201509978', null);
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
                    .showAds('ca-app-pub-1222451237037237/2201509978');
                await Get.toNamed(SubjectScreen.routeName,
                    arguments: gradeList[index].sub);
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
                          gradeList[index].gradeName.toString(),
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
