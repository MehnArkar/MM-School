import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/main.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/page/widgets/app_bar.dart';
import 'package:mm_school/utils/colors.dart';

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
        backgroundColor: AppColors.backgroundColor,
        body: isInternet
            ? GetBuilder<DataController>(builder: (dataController) {
                return Container(
                  margin: EdgeInsets.only(top: statusbar_height),
                  child: Column(
                    children: [
                      //App Bar
                      AppBarWidget(),
                      dataController.isLoaded
                          ? //Home Body
                          Expanded(
                              child: Container(
                              child: Column(
                                children: [
                                  //Image Banner
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    width: double.maxFinite,
                                    height: 200,
                                    child: Image.asset(
                                      'assets/img/foemi_img.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Divider(
                                    endIndent: 20,
                                    indent: 20,
                                    color: Colors.redAccent,
                                    thickness: 1.5,
                                  ),

                                  //Grid View
                                  Expanded(
                                    child: Container(
                                      child: GridView.count(
                                        childAspectRatio: 3,
                                        primary: false,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, bottom: 5),
                                        crossAxisCount: 2,
                                        children: List.generate(
                                            dataController.datamodel.state!
                                                .length, (index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              await showAds(null);
                                              await Get.toNamed(
                                                  LevelScreen.routeName,
                                                  arguments: dataController
                                                      .datamodel.level);
                                            },
                                            child: Container(
                                              width: double.maxFinite,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.7),
                                                    offset: Offset(0, 5),
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                color: AppColors.primaryColor,
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1.5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on_sharp,
                                                      color: Colors.white,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        dataController.datamodel
                                                            .state![index]
                                                            .toString(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ))
                          : Expanded(
                              child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.redAccent,
                              ),
                            )),
                    ],
                  ),
                );
              })
            : Container(
                child: Center(
                child: Text(
                  'Not internet connection!',
                  style: TextStyle(color: Colors.redAccent, fontSize: 20),
                ),
              )));
  }
}
