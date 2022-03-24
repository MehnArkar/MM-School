import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobleOnClick {
  DialogController dialogController = Get.find<DialogController>();
  AdController adController = Get.find();
  void onClick(String adUnit, String? url, String routeName, var argu,
      var context) async {
    dialogController.setTime();
    await Get.find<AdController>().loadAd(adUnit, url);
    dialogController.startTimer();
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimension.height20)),
            child: TimerDialog(),
          );
        });
    await Get.find<AdController>().showAds(adUnit);
    await Get.toNamed(routeName, arguments: argu);
  }

  void onCliclUrl(String adUnit, String? url, var context) async {
    dialogController.setTime();

    if (url != "") {
      adController.loadAd(adUnit, url);
      dialogController.startTimer();
      await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimension.height20)),
              child: TimerDialog(),
            );
          });
      if (adController.rewardedAd == null) {
        launch(url!);
      } else {
        await adController.showAds(adUnit);
      }
    } else {
      Get.snackbar('No data!', 'No data for this subject',
          backgroundColor: Colors.lightBlue, colorText: Colors.white);
    }
  }
}
