import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/utils/colors.dart';

class TimerDialog extends StatelessWidget {
  TimerDialog({Key? key}) : super(key: key);
  DialogController dialogController = Get.find<DialogController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: AppColors.primaryColor,
              width: 2,
              style: BorderStyle.solid)),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ads starting in ...',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return Text(dialogController.start.toString(),
                style: TextStyle(fontSize: 20, color: Colors.white));
          }),
        ],
      )),
    );
  }
}
