import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/dimension.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription _connectivitySubscription;

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
    double statusbar_height = MediaQuery.of(context).padding.top;
    print(Get.context!.height);
    print('internet is ' + isInternet.toString());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title:
              Text('MM School', style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            Container(
                margin: EdgeInsets.only(right: Dimension.height10),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  'assets/img/circle.png',
                  fit: BoxFit.fill,
                ))
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
        body: isInternet
            ? GetBuilder<DataController>(builder: (dataController) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  // margin: EdgeInsets.only(top: statusbar_height),
                  child: Stack(children: [
                    Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Container(
                          width: double.maxFinite,
                          height: Dimension.height200,
                          child: Image.asset(
                            'assets/img/banner.jpg',
                            fit: BoxFit.fill,
                          ),
                        )),
                    Positioned(
                        left: 0,
                        right: 0,
                        top: Dimension.height175,
                        bottom: 0,
                        child: Container(
                            padding: EdgeInsets.only(top: Dimension.height25),
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.purpleAccent,
                                    offset: Offset(0, -2),
                                    blurRadius: 7,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimension.height25),
                                    topRight:
                                        Radius.circular(Dimension.height25))),
                            child: dataController.isLoaded.value
                                ? GridView.count(
                                    childAspectRatio: (4 / 3),
                                    primary: false,
                                    crossAxisSpacing: Dimension.height20,
                                    mainAxisSpacing: Dimension.height20,
                                    padding: EdgeInsets.only(
                                      left: Dimension.height10,
                                      right: Dimension.height10,
                                      bottom: Dimension.height5,
                                      top: Dimension.height5,
                                    ),
                                    crossAxisCount: 2,
                                    children: List.generate(
                                        dataController.datamodel.state!.length,
                                        (index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          await showAds(null);
                                          await Get.toNamed(
                                              LevelScreen.routeName,
                                              arguments: dataController
                                                  .datamodel.level);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              Dimension.height15),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.7),
                                                offset: Offset(0, 5),
                                                blurRadius: 3,
                                              ),
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.7),
                                                offset: const Offset(0, 1),
                                                blurRadius: 3,
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Container(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: Dimension.height35,
                                                    height: Dimension.height35,
                                                    child: Image.asset(
                                                      'assets/img/location.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Dimension.height10,
                                                  ),
                                                  Text(
                                                    dataController
                                                        .datamodel.state![index]
                                                        .toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'RobotoCondensed',
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  )
                                : Center(
                                    child: Container(
                                      width: Dimension.height35,
                                      height: Dimension.height35,
                                      child: CircularProgressIndicator(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )))
                  ]),
                );
              })
            : Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: Dimension.height100,
                          height: Dimension.height100,
                          child: Image.asset('assets/img/no-signal.png')),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No internet connection!',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                )));
  }
}
