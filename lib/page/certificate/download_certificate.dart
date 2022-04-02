import 'dart:isolate';
import 'dart:ui';
import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/certificate_controller.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadCertificate extends StatefulWidget {
  static const routeName = '/downloadCertificate';
  const DownloadCertificate({Key? key}) : super(key: key);

  @override
  State<DownloadCertificate> createState() => _DownloadCertificateState();
}

class _DownloadCertificateState extends State<DownloadCertificate> {
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text('Certificate',
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
        body: GetBuilder<CertificateController>(
          builder: (controller) {
            return Container(
              padding: EdgeInsets.all(Dimension.height20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  (AppBar().preferredSize.height + Dimension.height10),
              child: Center(
                  child: controller.isLoaded
                      ? SizedBox(
                          width: Dimension.height35,
                          height: Dimension.height35,
                          child: CircularProgressIndicator())
                      : controller.studentModel.student.isNotEmpty
                          ?
                          //Correct
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width:
                                      Dimension.height100 + Dimension.height20,
                                  height:
                                      Dimension.height100 + Dimension.height20,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/congratulation.png'))),
                                ),
                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("Well Done! ",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    Text(
                                        controller.studentModel.student[0].name
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                const Text("Congratulations",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        height: 1.5)),
                                const Text(
                                    "You are eligible to attend Academic Year 2021-2022 Graduation Ceremony.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        height: 1.5)),
                                SizedBox(
                                  height: Dimension.height35,
                                ),
                                //Download Certificate Btn
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimension.height5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.4),
                                          offset: const Offset(0, 7),
                                          blurRadius: 4,
                                        ),
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.4),
                                          offset: const Offset(0, 2),
                                          blurRadius: 3,
                                        ),
                                      ],
                                      border: Border.all(
                                          color: Colors.blue, width: 1.5),
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
                                            'Download Certificate',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      onPressed: () async {
                                        Map<Permission, PermissionStatus>
                                            statuses = await [
                                          Permission.storage,
                                        ].request();

                                        if (statuses[Permission.storage]!
                                            .isGranted) {
                                          final dir = await ExternalPath
                                              .getExternalStoragePublicDirectory(
                                                  ExternalPath
                                                      .DIRECTORY_DOWNLOADS);
                                          if (dir != null) {
                                            var isExist = await File(dir +
                                                    '/${controller.studentModel.student[0].iD}.pdf')
                                                .exists();

                                            print(isExist);
                                            if (isExist) {
                                              Get.snackbar(
                                                  'File already exist!',
                                                  'You had been downloaded your certificate.',
                                                  colorText: Colors.lightBlue,
                                                  backgroundColor: Colors.white
                                                      .withOpacity(0.8));
                                            } else {
                                              Get.snackbar(
                                                  'Downloading Certificate file',
                                                  'Your certificate file store at Internal Storage/Download.',
                                                  colorText: Colors.lightBlue,
                                                  backgroundColor:
                                                      Colors.white);

                                              try {
                                                final taskId =
                                                    await FlutterDownloader
                                                        .enqueue(
                                                  url:
                                                      'https://foeimacademy.org/aca20212022/${controller.studentModel.student[0].iD}.pdf',
                                                  savedDir: dir,
                                                  showNotification: true,
                                                  openFileFromNotification:
                                                      true,
                                                );
                                              } catch (e) {
                                                Get.snackbar('Something wrong!',
                                                    'Can\'t download your certificate.',
                                                    backgroundColor: Colors.red,
                                                    colorText: Colors.white);
                                              }
                                            }
                                          }
                                        } else {
                                          Get.snackbar('Permission not allow!',
                                              'Please allow storage permission.',
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white);
                                        }
                                      }),
                                ),
                              ],
                            )
                          :
                          //Fail
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width:
                                      Dimension.height100 + Dimension.height20,
                                  height:
                                      Dimension.height100 + Dimension.height20,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/error.png'))),
                                ),
                                SizedBox(
                                  height: Dimension.height20,
                                ),

                                const Text('Opps! Something went wrong.',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),

                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                const Text(
                                    "It look like, you are not eligible for Academic Year 2021-2022 Graduation Ceremony OR you need to enter correct information.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        height: 1.5)),
                                SizedBox(
                                  height: Dimension.height35,
                                ),
                                //Fail Btn
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimension.height5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.4),
                                          offset: const Offset(0, 7),
                                          blurRadius: 4,
                                        ),
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.4),
                                          offset: const Offset(0, 2),
                                          blurRadius: 3,
                                        ),
                                      ],
                                      border: Border.all(
                                          color: Colors.blue, width: 1.5),
                                      color: Colors.blue),
                                  child: MaterialButton(
                                      child: const Text(
                                        'Try Again',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      }),
                                ),
                              ],
                            )),
            );
          },
        ));
  }
}
