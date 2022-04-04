import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/page/eclass_grade/eclass_grade.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:mm_school/utils/globleOnClick.dart';

class BatchScreen extends StatefulWidget {
  static const routeName = '/batchScreen';
  const BatchScreen({Key? key}) : super(key: key);

  @override
  State<BatchScreen> createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  EclassController eclassController = Get.find();
  DialogController dialogController = Get.find<DialogController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('E - Classes',
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
        child: GetBuilder<DataController>(builder: (controller) {
          return controller.isLoaded.value
              ? GridView.count(
                  childAspectRatio: (1 / 1.05),
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
                  children: List.generate(controller.datamodel.batch!.length,
                      (index) {
                    return GestureDetector(
                      onTap: () async {
                        eclassController.setBatch('b' +
                            controller.datamodel.batch![index].toString());
                        // GlobleOnClick().onClick(AppConstant.THIRTH_AD_UNIT,
                        //     null, EclassGrade.routeName, null, context);
                        Get.toNamed(EclassGrade.routeName);
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
                          color: AppColors.imageBgColor,
                          borderRadius:
                              BorderRadius.circular(Dimension.height15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: ((MediaQuery.of(context).size.width -
                                          (Dimension.height20 * 3)) /
                                      2) -
                                  Dimension.height20,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimension.height15),
                                    topRight:
                                        Radius.circular(Dimension.height15),
                                  ),
                                  child: Image.asset('assets/img/eclass.jpg',
                                      fit: BoxFit.fill)),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Batch - " +
                                      controller.datamodel.batch![index]
                                          .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: AppColors.imageColor,
                                      fontSize: 20,
                                      fontFamily: 'RobotoCondensed',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              : Center(
                  child: SizedBox(
                    width: Dimension.height35,
                    height: Dimension.height35,
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
