import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/certificate_controller.dart';
import 'package:mm_school/page/certificate/download_certificate.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/dimension.dart';

class EclassForm extends StatefulWidget {
  static const routeName = '/eclassForm';
  const EclassForm({Key? key}) : super(key: key);

  @override
  State<EclassForm> createState() => _EclassFormState();
}

class _EclassFormState extends State<EclassForm> {
  bool isComplete = true;
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Verify Identity',
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              (AppBar().preferredSize.height * 2),
          child: Center(
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.all(Dimension.height20),
              padding: EdgeInsets.all(Dimension.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimension.height15),
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
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Image
                  SizedBox(
                    width: Dimension.height175 - Dimension.height50,
                    height: Dimension.height175 - Dimension.height50,
                    child: Image.asset(
                      'assets/img/blurFOEIM.png',
                      fit: BoxFit.fill,
                    ),
                  ),

                  Text(
                    'FOEIM E-CLASSES',
                    style: TextStyle(
                      color: AppColors.imageColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height35,
                  ),
                  isComplete
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(bottom: Dimension.height10),
                          child: const Text(
                            'Please fill the student ID !',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          )),
                  Row(
                    children: [
                      Text(
                        'Enter your student ID',
                        style: TextStyle(
                            color: AppColors.imageColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  //Student Name Textfield
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimension.height35),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1))
                        ]),
                    child: TextField(
                        onSubmitted: (value) {},
                        controller: idController,
                        decoration: InputDecoration(
                            hintText: 'Example - A00001',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimension.height35),
                                borderSide: const BorderSide(
                                    width: 1.0, color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimension.height35),
                                borderSide: const BorderSide(
                                    width: 1.0, color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimension.height35)))),
                  ),

                  SizedBox(height: Dimension.height35),
                  //Check Button
                  GetBuilder<CertificateController>(builder: (controller) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.height5),
                          border: Border.all(
                              color: AppColors.imageColor, width: 1.5)),
                      child: MaterialButton(
                          child: Text(
                            'Check Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.imageColor,
                            ),
                          ),
                          onPressed: () {
                            if (idController.text.isNotEmpty) {
                              setState(() {
                                isComplete = true;
                              });

                              controller
                                  .getEClassCertifyStudent(idController.text);
                              Get.toNamed(DownloadCertificate.routeName);
                            } else {
                              setState(() {
                                isComplete = false;
                              });
                            }
                          }),
                    );
                  }),

                  SizedBox(height: Dimension.height10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
