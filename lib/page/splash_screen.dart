import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/page/auth/sign_in.dart';
import 'package:mm_school/page/auth/sign_up.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    // bool? loginStatus = sharedPreferences?.getBool("loginStatus");
    // print(loginStatus);
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
      // if (loginStatus == null) {
      //   Get.offNamed(SignIn.routeName);
      // } else if (loginStatus) {
      //   Navigator.of(context).pop();
      // } else {
      //   Get.offNamed(SignIn.routeName);
      // }
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
