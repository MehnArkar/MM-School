import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/certificate_controller.dart';
import 'package:mm_school/utils/dimension.dart';

class DownloadCertificate extends StatefulWidget {
  static const routeName = '/downloadCertificate';
  const DownloadCertificate({Key? key}) : super(key: key);

  @override
  State<DownloadCertificate> createState() => _DownloadCertificateState();
}

class _DownloadCertificateState extends State<DownloadCertificate> {
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
                                      onPressed: () {}),
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
