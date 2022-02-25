import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  late Timer timer;
  RxInt start = 5.obs;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value < 1) {
          timer.cancel();
          Navigator.of(Get.context!).pop();
        } else {
          start.value = start.value - 1;
        }
      },
    );
  }

  void setTime() {
    start.value = 5;
  }
}
