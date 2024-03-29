import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/controller/identity_controller.dart';
import 'package:mm_school/model/identity_model.dart';
import 'package:mm_school/page/widgets/timer_dialog.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class IdentityCard extends StatefulWidget {
  static const routeName = '/ideneityCardScreen';
  const IdentityCard({Key? key}) : super(key: key);

  @override
  State<IdentityCard> createState() => _IdentityCardState();
}

class _IdentityCardState extends State<IdentityCard> {
  DialogController dialogController = Get.find();
  AdController adController = Get.find();
  final GlobalKey genKey = GlobalKey();

  Future<void> takePicture() async {
    RenderRepaintBoundary? boundary =
        genKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image image = await boundary!.toImage();
    final directory = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_PICTURES);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = File('$directory/studentID.png');
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request().then((value) async {
        if (value.isGranted) {
          await imgFile.writeAsBytes(pngBytes);
          Get.snackbar(
              'Student ID Card saved to photo', '$directory/ID-card.png',
              backgroundColor: Colors.white, colorText: Colors.blue);
        } else if (value.isDenied) {
          Get.snackbar(
              'Permission not allow', 'Please allow storage permission',
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
    } else if (status.isGranted) {
      await imgFile.writeAsBytes(pngBytes);
      Get.snackbar('Student ID Card saved to photo', '$directory/ID-card.png',
          backgroundColor: Colors.white, colorText: Colors.blue);
    }
  }

  void _showAds(link) async {
    dialogController.setTime();
    adController.loadAd(AppConstant.FOURTH_AD_UNIT, link);
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
      launch(link);
    } else {
      await adController.showAds(AppConstant.FOURTH_AD_UNIT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Student Identity',
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
      body: GetBuilder<IdentityController>(builder: (controller) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          padding: EdgeInsets.only(
              left: Dimension.height20, right: Dimension.height20),
          child: controller.isLoaded
              ? controller.identityModel.identity.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RepaintBoundary(
                              key: genKey,
                              child:
                                  idCard(controller.identityModel.identity[0])),
                          SizedBox(
                            height: Dimension.height20,
                          ),
                          //Save btn
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimension.height5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.5),
                                    offset: const Offset(0, 7),
                                    blurRadius: 4,
                                  ),
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.5),
                                    offset: const Offset(0, 2),
                                    blurRadius: 3,
                                  ),
                                ],
                                border:
                                    Border.all(color: Colors.blue, width: 1.5),
                                color: Colors.blue),
                            child: MaterialButton(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.download_sharp,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: Dimension.height10,
                                    ),
                                    const Text(
                                      'Save to photo',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                onPressed: takePicture),
                          ),
                          SizedBox(
                            height: Dimension.height10,
                          ),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //User Guide btn
                              Expanded(
                                child: buttonWidget('User Guide', () {
                                  _showAds(AppConstant.USER_GUIDE);
                                }),
                              ),

                              SizedBox(
                                width: Dimension.height5,
                              ),
                              //Get outlook Btn
                              Expanded(
                                child: buttonWidget('Get Outlook', () {
                                  _showAds(AppConstant.GET_OUTLOOK);
                                }),
                              ),
                              SizedBox(
                                width: Dimension.height5,
                              ),
                              //Join Group btn
                              Expanded(
                                child: buttonWidget('Join Group', () {
                                  if (controller
                                          .identityModel.identity[0].fbLink
                                          .toString() !=
                                      '#') {
                                    _showAds(controller
                                        .identityModel.identity[0].fbLink
                                        .toString());
                                  } else {
                                    Get.snackbar('Can\'t join group!',
                                        'Group can only be join at the first time',
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red);
                                  }
                                }),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: Dimension.height20,
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: unRegister(),
                    )
              : Center(
                  child: SizedBox(
                      width: Dimension.height35,
                      height: Dimension.height35,
                      child: const CircularProgressIndicator()),
                ),
        );
      }),
    );
  }

  Widget idCard(Identity identity) {
    return Container(
      margin: EdgeInsets.only(top: Dimension.height20),
      padding: EdgeInsets.all(Dimension.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.height10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(0, 7),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(0, 2),
            blurRadius: 3,
          ),
        ],
        image: const DecorationImage(
            image: AssetImage('assets/img/cardBg.PNG'), fit: BoxFit.fill),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //Image
            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width -
                          Dimension.height100) /
                      2,
                  height: (MediaQuery.of(context).size.width -
                          Dimension.height100) /
                      2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.height20),
                    image: const DecorationImage(
                        image: AssetImage('assets/img/idcard.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: Dimension.height20,
                ),
                Container(
                  padding: EdgeInsets.all(Dimension.height5),
                  width: (MediaQuery.of(context).size.width -
                          Dimension.height100) /
                      2,
                  height: (MediaQuery.of(context).size.width -
                          Dimension.height100) /
                      2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimension.height20),
                  ),
                  child: QrImage(
                    data:
                        "Row ID = ${identity.id} | Student Name = ${identity.fullName} | Student ID = ${identity.studentId} | Grade = ${identity.grade}",
                    version: QrVersions.auto,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: Dimension.height20,
            ),
            Text(identity.fullName.toString(),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(
              height: Dimension.height5,
            ),
            Text(identity.email.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(
              height: Dimension.height20,
            ),
            const Text('This is your student identity card.',
                style: TextStyle(fontSize: 16)),
            SizedBox(
              height: Dimension.height20,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                  '${identity.grade} | ${identity.classtype} | ${identity.batch} student',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            const Divider(
              endIndent: 3,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: Dimension.height10,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('Student ID - ${identity.studentId}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            const Divider(
              endIndent: 3,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: Dimension.height10,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('Class Email - ${identity.classEmail}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            const Divider(
              endIndent: 3,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: Dimension.height10,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('Password - ${identity.password}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            const Divider(
              endIndent: 3,
              thickness: 1,
              color: Colors.grey,
            ),
          ]),
    );
  }

  Widget unRegister() {
    return Container(
      padding: EdgeInsets.all(Dimension.height20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.height10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              offset: const Offset(0, 7),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              offset: const Offset(0, 2),
              blurRadius: 3,
            ),
          ],
          image: const DecorationImage(
              image: AssetImage('assets/img/cardBg.PNG'), fit: BoxFit.fill)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //image
          Container(
            width: Dimension.height100 + Dimension.height25,
            height: Dimension.height100 + Dimension.height25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.height20),
                image: const DecorationImage(
                    image: AssetImage('assets/img/idcard.jpg'),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: Dimension.height20,
          ),
          const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('You are not registered student!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: Dimension.height20,
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Help Btn
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(Dimension.height5),
                      border: Border.all(width: 1.5, color: Colors.blue)),
                  child: MaterialButton(
                    onPressed: () {
                      _showAds(AppConstant.HELP_URL);
                    },
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Help',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Dimension.height20,
              ),
              //Message Btn
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.height5),
                      border: Border.all(width: 1.5, color: Colors.blue)),
                  child: MaterialButton(
                    onPressed: () {
                      _showAds(AppConstant.MESSAGE_URL);
                    },
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Message',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonWidget(String title, onTap) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.height5),
          border: Border.all(color: Colors.blue, width: 1.5),
        ),
        child: MaterialButton(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          onPressed: onTap,
        ));
  }
}
