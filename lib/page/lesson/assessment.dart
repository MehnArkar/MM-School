import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/model/eclass_model.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class Assessment extends StatefulWidget {
  Assessment({Key? key}) : super(key: key);

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  AdController adController = Get.find();
  EclassController eclassController = Get.find();

  DialogController dialogController = Get.find();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await pullRefresh();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await pullRefresh();
    _refreshController.loadComplete();
  }

  Future<void> pullRefresh() async {
    eclassController.isLoaded = false;
    eclassController.lessonModel = EclassModel(eclassData: []);
    eclassController.assessmentModel = EclassModel(eclassData: []);

    String batch = eclassController.batch.toString();
    String grade = eclassController.grade.toString();
    await eclassController.getEclassData(grade, batch, 'Assessment');
    await eclassController.getEclassData(grade, batch, 'Lesson');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EclassController>(builder: (controller) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: controller.isLoaded
            ? SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: const WaterDropHeader(
                  waterDropColor: Colors.blue,
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: controller.assessmentModel.eclassData.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.only(bottom: Dimension.height10),
                        itemCount: controller.assessmentModel.eclassData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              dialogController.setTime();

                              if (controller
                                      .assessmentModel.eclassData[index].link !=
                                  "") {
                                adController.loadAd(
                                    AppConstant.SECOND_AD_UNIT,
                                    controller
                                        .assessmentModel.eclassData[index].link
                                        .toString());
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
                                if (adController.rewardedAd == null) {
                                  launch(controller
                                      .assessmentModel.eclassData[index].link
                                      .toString());
                                } else {
                                  await adController
                                      .showAds(AppConstant.SECOND_AD_UNIT);
                                }
                              } else {
                                Get.snackbar(
                                    'No data!', 'No data for this Lesson',
                                    backgroundColor: Colors.lightBlue,
                                    colorText: Colors.white);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(Dimension.height10),
                              margin: EdgeInsets.only(
                                  top: Dimension.height10,
                                  left: Dimension.height20,
                                  right: Dimension.height20),
                              width: double.maxFinite,
                              height: Dimension.height100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.lightBlue, width: 1),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: Dimension.height100,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                              width: Dimension.height50,
                                              height: Dimension.height50,
                                              child: Image.asset(
                                                  'assets/img/assessment.png',
                                                  fit: BoxFit.cover)),
                                          SizedBox(
                                            height: Dimension.height10,
                                          ),
                                          Text(
                                            controller.assessmentModel
                                                .eclassData[index].subject
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimension.height5,
                                    ),
                                    const VerticalDivider(
                                      thickness: 2,
                                      color: Colors.lightBlue,
                                    ),
                                    SizedBox(
                                      width: Dimension.height5,
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          controller.assessmentModel
                                              .eclassData[index].description
                                              .toString(),
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'RobotoCondensed',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: Text(
                          'No assessment yet!',
                          style: TextStyle(fontSize: 20),
                        ),
                      ))
            : Center(
                child: SizedBox(
                    width: Dimension.height35,
                    height: Dimension.height35,
                    child: const CircularProgressIndicator()),
              ),
      );
    });
  }
}
