import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/utils/dimension.dart';

class TimerDialog extends StatelessWidget {
  TimerDialog({Key? key}) : super(key: key);
  DialogController dialogController = Get.find<DialogController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.height200,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.height20),
          border: Border.all(
              color: Colors.lightBlue, width: 2.5, style: BorderStyle.solid)),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: Dimension.height50,
              height: Dimension.height50,
              child: Image.asset('assets/img/stopwatch.png')),
          SizedBox(
            height: Dimension.height20,
          ),
          Obx(() {
            return Text('Ad starting in : ' + dialogController.start.toString(),
                style: const TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.lightBlue));
          }),
        ],
      )),
    );
  }
}
