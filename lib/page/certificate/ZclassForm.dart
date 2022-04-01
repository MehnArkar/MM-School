import 'package:flutter/material.dart';
import 'package:mm_school/controller/certificate_controller.dart';
import 'package:mm_school/controller/identity_controller.dart';
import 'package:mm_school/page/Identity/identity_card.dart';
import 'package:mm_school/page/certificate/download_certificate.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:get/get.dart';

class ZClassForm extends StatefulWidget {
  static const routeName = '/zClassFormScreen';
  const ZClassForm({Key? key}) : super(key: key);

  @override
  State<ZClassForm> createState() => _ZClassFormState();
}

class _ZClassFormState extends State<ZClassForm> {
  bool isComplete = true;
  TextEditingController nameController = TextEditingController();

  String yearValue = "unselect";
  String sectionNameValue = "unselect";
  String sectionNumberValue = "unselect";
  String gradeValue = "unselect";

  //Year dropdown
  List<DropdownMenuItem<String>> get yeardropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Academic Year"), value: "unselect"),
      const DropdownMenuItem(child: Text("2021 - 2022"), value: "20212022"),
      const DropdownMenuItem(child: Text("2023 - 2024"), value: "20232024"),
      const DropdownMenuItem(child: Text("2025 - 2026"), value: "20252026"),
      const DropdownMenuItem(child: Text("2027 - 2028"), value: "20272028"),
      const DropdownMenuItem(child: Text("2029 - 2030"), value: "20292030"),
    ];
    return menuItems;
  }

  //Section Name dropdown
  List<DropdownMenuItem<String>> get sectionNamedropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Section Name"), value: "unselect"),
      const DropdownMenuItem(child: Text("Section -"), value: ""),
      const DropdownMenuItem(child: Text("Section - A"), value: "A"),
      const DropdownMenuItem(child: Text("Section - B"), value: "B"),
      const DropdownMenuItem(child: Text("Section - C"), value: "C"),
      const DropdownMenuItem(child: Text("Section - D"), value: "D"),
    ];
    return menuItems;
  }

  //Section Name dropdown
  List<DropdownMenuItem<String>> get sectionNumberdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Section Number"), value: "unselect"),
      const DropdownMenuItem(child: Text("1"), value: "1"),
      const DropdownMenuItem(child: Text("2"), value: "2"),
      const DropdownMenuItem(child: Text("3"), value: "3"),
      const DropdownMenuItem(child: Text("4"), value: "4"),
      const DropdownMenuItem(child: Text("5"), value: "5"),
      const DropdownMenuItem(child: Text("6"), value: "6"),
      const DropdownMenuItem(child: Text("7"), value: "7"),
      const DropdownMenuItem(child: Text("8"), value: "8"),
      const DropdownMenuItem(child: Text("9"), value: "9"),
      const DropdownMenuItem(child: Text("10"), value: "10"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get gradeDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Grade"), value: "unselect"),
      const DropdownMenuItem(child: Text("Grade - 1"), value: "01"),
      const DropdownMenuItem(child: Text("Grade - 2"), value: "02"),
      const DropdownMenuItem(child: Text("Grade - 3"), value: "03"),
      const DropdownMenuItem(child: Text("Grade - 4"), value: "04"),
      const DropdownMenuItem(child: Text("Grade - 6"), value: "06"),
      const DropdownMenuItem(child: Text("Grade - 7"), value: "07"),
      const DropdownMenuItem(child: Text("Grade - 8"), value: "08"),
      const DropdownMenuItem(child: Text("Grade - 9"), value: "09"),
      const DropdownMenuItem(child: Text("Grade - 10"), value: "10"),
      const DropdownMenuItem(child: Text("Grade - 11"), value: "11")
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Certify Student',
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
              (AppBar().preferredSize.height + Dimension.height10),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
              child: Column(
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
                    'Certifyme By FOEIM Academy',
                    style: TextStyle(
                      color: AppColors.imageColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  isComplete
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(bottom: Dimension.height10),
                          child: const Text(
                            'Please fill all of require data !',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          )),
                  //Academic Year
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimension.height10, right: Dimension.height10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.height5),
                        border:
                            Border.all(color: AppColors.imageColor, width: 1)),
                    child: Center(
                      child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          value: yearValue,
                          items: yeardropdownItems,
                          onChanged: (String? newValue) {
                            setState(() {
                              yearValue = newValue!;
                            });
                          }),
                    ),
                  ),

                  SizedBox(
                    height: Dimension.height20,
                  ),
                  //Student Name Textfield
                  Container(
                    height: Dimension.height50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimension.height5),
                        border:
                            Border.all(color: AppColors.imageColor, width: 1)),
                    child: Center(
                      child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              hintText: 'Student Name',
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
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  //Section Name

                  Container(
                    padding: EdgeInsets.only(
                        left: Dimension.height10, right: Dimension.height10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.height5),
                        border:
                            Border.all(color: AppColors.imageColor, width: 1)),
                    child: Center(
                      child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          value: sectionNameValue,
                          items: sectionNamedropdownItems,
                          onChanged: (String? newValue) {
                            setState(() {
                              sectionNameValue = newValue!;
                            });
                          }),
                    ),
                  ),

                  SizedBox(
                    height: Dimension.height20,
                  ),
                  //Section Number

                  Container(
                    padding: EdgeInsets.only(
                        left: Dimension.height10, right: Dimension.height10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.height5),
                        border:
                            Border.all(color: AppColors.imageColor, width: 1)),
                    child: Center(
                      child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          value: sectionNumberValue,
                          items: sectionNumberdropdownItems,
                          onChanged: (String? newValue) {
                            setState(() {
                              sectionNumberValue = newValue!;
                            });
                          }),
                    ),
                  ),

                  SizedBox(
                    height: Dimension.height20,
                  ),
                  //Grade
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimension.height10, right: Dimension.height10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.height5),
                        border:
                            Border.all(color: AppColors.imageColor, width: 1)),
                    child: Center(
                      child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          value: gradeValue,
                          items: gradeDropdownItems,
                          onChanged: (String? newValue) {
                            setState(() {
                              gradeValue = newValue!;
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: Dimension.height20),
                  //Check Button
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.height5),
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
                          if (yearValue != 'unselect' &&
                              nameController.text.isNotEmpty &&
                              sectionNameValue != 'unselect' &&
                              sectionNumberValue != 'unselect' &&
                              gradeValue != 'unselect') {
                            setState(() {
                              isComplete = true;
                            });
                            Get.find<CertificateController>().getCertifyStudent(
                                yearValue,
                                nameController.text,
                                sectionNameValue,
                                sectionNumberValue,
                                gradeValue);
                            Get.toNamed(DownloadCertificate.routeName);
                          } else {
                            setState(() {
                              isComplete = false;
                            });
                          }
                        }),
                  ),

                  SizedBox(height: Dimension.height20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
