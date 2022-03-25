import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/model/eclass_model.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:mm_school/utils/globleOnClick.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Assessment extends StatefulWidget {
  String grade;
  Assessment({Key? key, required this.grade}) : super(key: key);

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
                child: controller.assessmentModel.eclassData.length != 0
                    ? ListView.builder(
                        padding: EdgeInsets.only(bottom: Dimension.height10),
                        itemCount: controller.assessmentModel.eclassData.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(Dimension.height5),
                            margin: EdgeInsets.only(
                                top: Dimension.height10,
                                left: Dimension.height20,
                                right: Dimension.height20),
                            width: double.maxFinite,
                            height: Dimension.height100,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Dimension.height20 * 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                            width: Dimension.height50,
                                            height: Dimension.height50,
                                            child: Image.asset(
                                                'assets/img/assessment.png',
                                                fit: BoxFit.cover)),
                                        SizedBox(
                                          height: Dimension.height10,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            controller.assessmentModel
                                                .eclassData[index].subject
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.assessmentModel
                                              .eclassData[index].description
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 158, 148, 148),
                                              fontSize: 14,
                                              fontFamily: 'RobotoCondensed',
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: Dimension.height35 -
                                                      Dimension.height5,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimension
                                                                  .height35 /
                                                              2),
                                                      color: Colors.lightBlue),
                                                  child: MaterialButton(
                                                      child: const FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                          'Assessment',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        GlobleOnClick().onCliclUrl(
                                                            AppConstant
                                                                .FIRST_AD_UNIT,
                                                            controller
                                                                .assessmentModel
                                                                .eclassData[
                                                                    index]
                                                                .link,
                                                            context);
                                                      }),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Dimension.height5,
                                              ),
                                              Container(
                                                height: Dimension.height35 -
                                                    Dimension.height5,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimension.height35 /
                                                              2),
                                                  border: Border.all(
                                                      color: Colors.lightBlue,
                                                      width: 1.5),
                                                ),
                                                child: MaterialButton(
                                                    child: const FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        'Details',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .lightBlue,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          builder: (context) {
                                                            return Container(
                                                              padding: EdgeInsets
                                                                  .all(Dimension
                                                                      .height20),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  2,
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child:
                                                                                Container()),
                                                                        Text(
                                                                          'Grade - ${widget.grade}',
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 18),
                                                                        ),
                                                                        Expanded(
                                                                            child:
                                                                                Container()),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: Dimension
                                                                          .height20,
                                                                    ),
                                                                    Text(
                                                                      controller
                                                                          .assessmentModel
                                                                          .eclassData[
                                                                              index]
                                                                          .subject
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                    SizedBox(
                                                                      height: Dimension
                                                                          .height10,
                                                                    ),
                                                                    Text(
                                                                      controller
                                                                          .assessmentModel
                                                                          .eclassData[
                                                                              index]
                                                                          .description
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          height:
                                                                              1.5),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    }),
                                              ),
                                            ])
                                      ],
                                    ),
                                  ),
                                ],
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
