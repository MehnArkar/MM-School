import 'package:flutter/material.dart';
import 'package:mm_school/controller/examroom_controller.dart';
import 'package:mm_school/page/exam_room/zclass_info.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:get/get.dart';

class ExamZclass extends StatefulWidget {
  static const routeName = '/ExamZclass';
  const ExamZclass({Key? key}) : super(key: key);

  @override
  State<ExamZclass> createState() => _ExamZclassState();
}

class _ExamZclassState extends State<ExamZclass> {
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
      const DropdownMenuItem(child: Text("11"), value: "11"),
      const DropdownMenuItem(child: Text("12"), value: "12"),
      const DropdownMenuItem(child: Text("13"), value: "13"),
      const DropdownMenuItem(child: Text("14"), value: "14"),
      const DropdownMenuItem(child: Text("15"), value: "15"),
      const DropdownMenuItem(child: Text("16"), value: "16"),
      const DropdownMenuItem(child: Text("17"), value: "17"),
      const DropdownMenuItem(child: Text("18"), value: "18"),
      const DropdownMenuItem(child: Text("19"), value: "19"),
      const DropdownMenuItem(child: Text("20"), value: "20"),
      const DropdownMenuItem(child: Text("21"), value: "21"),
      const DropdownMenuItem(child: Text("22"), value: "22"),
      const DropdownMenuItem(child: Text("23"), value: "23"),
      const DropdownMenuItem(child: Text("24"), value: "24"),
      const DropdownMenuItem(child: Text("25"), value: "25"),
      const DropdownMenuItem(child: Text("26"), value: "26"),
      const DropdownMenuItem(child: Text("27"), value: "27"),
      const DropdownMenuItem(child: Text("28"), value: "28"),
      const DropdownMenuItem(child: Text("29"), value: "29"),
      const DropdownMenuItem(child: Text("30"), value: "30"),
      const DropdownMenuItem(child: Text("31"), value: "31"),
      const DropdownMenuItem(child: Text("32"), value: "32"),
      const DropdownMenuItem(child: Text("33"), value: "33"),
      const DropdownMenuItem(child: Text("34"), value: "34"),
      const DropdownMenuItem(child: Text("35"), value: "35"),
      const DropdownMenuItem(child: Text("36"), value: "36"),
      const DropdownMenuItem(child: Text("37"), value: "37"),
      const DropdownMenuItem(child: Text("38"), value: "38"),
      const DropdownMenuItem(child: Text("39"), value: "39"),
      const DropdownMenuItem(child: Text("40"), value: "40"),
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
              (AppBar().preferredSize.height + Dimension.height10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 30, right: 30),
              child: Column(
                children: [
                  //Image
                  SizedBox(
                    width: Dimension.height175 - Dimension.height50,
                    height: Dimension.height175 - Dimension.height50,
                    child: Image.asset(
                      'assets/img/FOEIM.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),

                  Text(
                    'FOEIM ZOOM-CLASSES',
                    style: TextStyle(
                      color: AppColors.imageColor,
                      fontSize: 22,
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
                            Get.find<ExamRoomController>().getZoomStudent(
                                yearValue,
                                nameController.text,
                                sectionNameValue,
                                sectionNumberValue,
                                gradeValue);
                            Get.toNamed(ZclassInfo.routeName);
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
