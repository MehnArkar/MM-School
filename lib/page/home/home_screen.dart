import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/page/Identity/class_type.dart';
import 'package:mm_school/page/batch/batch_screen.dart';
import 'package:mm_school/page/certificate/certificate_classtype.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/page/widgets/comingsoon_dialog.dart';
import 'package:mm_school/page/widgets/connection_dialog.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DialogController dialogController = Get.find();
  late StreamSubscription _connectivitySubscription;
  double dotIndicatorIndex = 0;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print('Current connectivity status: $result');
      if (result == ConnectivityResult.wifi) {
        print('Connected to a Wi-Fi network');
        setState(() {
          isInternet = true;
          Get.find<DataController>().getData();
        });
      } else if (result == ConnectivityResult.mobile) {
        print('Connected to a mobile network');
        setState(() {
          isInternet = true;
          Get.find<DataController>().getData();
        });
      } else {
        print('Not connected to any network');
        setState(() {
          isInternet = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    List imgList = [
      'assets/img/Foemie.jpg',
      'assets/img/Education.jpg',
      'assets/img/Eacademy.jpg',
      'assets/img/Ecertificate.jpg',
      'assets/img/StuidentID.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('MM School',
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
      backgroundColor: AppColors.backgroundColor,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Auto Image Slider
                Container(
                  margin: EdgeInsets.only(top: Dimension.height10),
                  child: CarouselSlider.builder(
                    itemCount: imgList.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        height: Dimension.height100 + Dimension.height20,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.height15),
                            image: DecorationImage(
                                image: AssetImage(
                                  imgList[index],
                                ),
                                fit: BoxFit.fill)),
                      );
                    },
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          dotIndicatorIndex = double.parse(index.toString());
                        });
                      },
                      aspectRatio: 16 / 9,
                      height: Dimension.height100 + Dimension.height50,
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimension.height10,
                ),
                //Dots indicator
                DotsIndicator(
                  dotsCount: imgList.length,
                  position: dotIndicatorIndex,
                  decorator: DotsDecorator(
                    activeColor: Colors.blue[400],
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: Dimension.height10,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: Dimension.height10, right: Dimension.height10),
                  child: Row(
                    children: [
                      //Academy
                      classWidget("Academy", "assets/img/academy.png", () {
                        onClick(AppConstant.FIRST_AD_UNIT, null,
                            LevelScreen.routeName, null);
                      }),
                      SizedBox(
                        width: Dimension.height20,
                      ),
                      //E-classes
                      classWidget("E-classes", "assets/img/Eclasses.png", () {
                        onClick(AppConstant.FIRST_AD_UNIT, null,
                            BatchScreen.routeName, null);
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimension.height20,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: Dimension.height10, right: Dimension.height10),
                  child: Row(
                    children: [
                      //Lu Htu College
                      classWidget("Lu Htu College", "assets/img/college.png",
                          () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimension.height20)),
                                child: const ComingDialog(),
                              );
                            });
                      }),
                      SizedBox(
                        width: Dimension.height20,
                      ),
                      //Exam Room
                      classWidget('Exam Room', "assets/img/exam.png", () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimension.height20)),
                                  child: const ComingDialog());
                            });
                      })
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimension.height20,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: Dimension.height10, right: Dimension.height10),
                  child: Row(
                    children: [
                      //Check Identity
                      classWidget("Check Identity", "assets/img/identity.png",
                          () {
                        onClick(AppConstant.FIRST_AD_UNIT, null,
                            ClassType.routeName, null);
                      }),
                      SizedBox(
                        width: Dimension.height20,
                      ),
                      //Get Certificate
                      classWidget(
                          'Get Certificate', "assets/img/certificate.png", () {
                        // onClick(AppConstant.FIRST_AD_UNIT, null,
                        //     CertificateClassType.routeName, null);
                        Get.toNamed(CertificateClassType.routeName);
                      })
                    ],
                  ),
                ),

                SizedBox(
                  height: Dimension.height20,
                )
              ],
            ),
          )),
    );
  }

  Widget classWidget(String className, String imgPath, Function onClick) {
    return Expanded(
      child: Container(
        height: ((MediaQuery.of(context).size.width -
                (Dimension.height35 + Dimension.height5)) /
            2),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: ((MediaQuery.of(context).size.width -
                              (Dimension.height35 + Dimension.height5)) /
                          2) -
                      (Dimension.height35 / 2),
                  padding: EdgeInsets.only(bottom: Dimension.height35 / 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimension.height15),
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
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          imgPath,
                          width: Dimension.height50,
                          height: Dimension.height50,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: Dimension.height10,
                        ),
                        Text(
                          className,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    onClick();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimension.height35 / 2),
                      border: Border.all(width: 1.5, color: Colors.lightBlue),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
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
                    ),
                    height: Dimension.height35,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: Text(
                        'Start',
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void onClick(String adUnit, String? url, String routeName, var argu) async {
    if (isInternet) {
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
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimension.height20)),
              child: const ConnectionDialog(),
            );
          });
    }
  }
}
