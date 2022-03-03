import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:url_launcher/url_launcher.dart';

class SubjectScreen extends StatefulWidget {
  static const routeName = '/subjectScreen';
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  DialogController dialogController = Get.find();
  AdController adController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Sub> subList = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Subjects',
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
          children: List.generate(subList.length, (index) {
            return GestureDetector(
              onTap: () async {
                dialogController.setTime();

                if (subList[index].link != "") {
                  adController.loadAd(
                      AppConstant.FOURTH_AD_UNIT, subList[index].link);
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
                  if (adController.rewardedAd == null) {
                    launch(subList[index].link.toString());
                  } else {
                    await adController.showAds(AppConstant.FOURTH_AD_UNIT);
                  }
                } else {
                  Get.snackbar('No data!', 'No data for this subject',
                      backgroundColor: Colors.lightBlue,
                      colorText: Colors.white);
                }
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
                          child: Image.asset('assets/img/books.png',
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: Dimension.height10,
                        ),
                        Text(
                          subList[index].subName.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: 'RobotoCondensed',
                              color: Colors.black,
                              fontSize: 20,
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
