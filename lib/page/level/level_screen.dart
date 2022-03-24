import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/page/batch/batch_screen.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:mm_school/utils/globleOnClick.dart';

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
        body: GetBuilder<DataController>(
          builder: (controller) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Center(
                  child: controller.isLoaded.value
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                              controller.datamodel.level!.length, (index) {
                            return Container(
                              padding: EdgeInsets.all(Dimension.height20),
                              margin: EdgeInsets.only(
                                  top: Dimension.height10,
                                  bottom: Dimension.height10,
                                  left: Dimension.height20,
                                  right: Dimension.height20),
                              width: double.maxFinite,
                              height: Dimension.height100 + Dimension.height25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Dimension.height15),
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
                                        child: Image.asset(
                                            'assets/img/school-bag.png',
                                            fit: BoxFit.cover)),
                                    SizedBox(
                                      width: Dimension.height20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            controller.datamodel.level![index]
                                                .levelName
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: 'RobotoCondensed',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Expanded(child: Container()),
                                          //Select btn
                                          GestureDetector(
                                            onTap: () {
                                              GlobleOnClick().onClick(
                                                  AppConstant.SECOND_AD_UNIT,
                                                  null,
                                                  GradeScreen.routeName,
                                                  controller.datamodel
                                                      .level![index].grade,
                                                  context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimension.height35 / 2),
                                                border: Border.all(
                                                    width: 1.5,
                                                    color: Colors.lightBlue),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.blue
                                                        .withOpacity(0.3),
                                                    offset: const Offset(0, 5),
                                                    blurRadius: 3,
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.7),
                                                    offset: const Offset(0, 1),
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              height: Dimension.height35,
                                              margin: EdgeInsets.only(
                                                  left: Dimension.height10,
                                                  right: Dimension.height10),
                                              child: Center(
                                                child: Text(
                                                  'Select',
                                                  style: TextStyle(
                                                      color: Colors.blue[400],
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        )
                      : SizedBox(
                          width: Dimension.height35,
                          height: Dimension.height35,
                          child: const CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                ));
          },
        ));
  }
}
