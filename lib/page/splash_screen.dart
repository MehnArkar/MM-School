import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/utils/dimension.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(
            left: Dimension.height20, right: Dimension.height20),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: Container(
            width: Dimension.height350,
            height: Dimension.height350,
            child: Image.asset(
              'assets/img/app_logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
