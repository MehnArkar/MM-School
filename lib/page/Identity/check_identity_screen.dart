import 'package:flutter/material.dart';
import 'package:mm_school/controller/identity_controller.dart';
import 'package:mm_school/page/Identity/identity_card.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:get/get.dart';

class CheckIdentityScreen extends StatefulWidget {
  static const routeName = '/checkIdentityScreen';
  const CheckIdentityScreen({Key? key}) : super(key: key);

  @override
  State<CheckIdentityScreen> createState() => _CheckIdentityScreenState();
}

class _CheckIdentityScreenState extends State<CheckIdentityScreen> {
  late FocusNode emailFocus;
  bool isComplete = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String selectedValue = "unselect";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Choose Your Grade Here"), value: "unselect"),
      DropdownMenuItem(child: Text("Grade - 1"), value: "1"),
      DropdownMenuItem(child: Text("Grade - 2"), value: "2"),
      DropdownMenuItem(child: Text("Grade - 3"), value: "3"),
      DropdownMenuItem(child: Text("Grade - 4"), value: "4"),
      DropdownMenuItem(child: Text("Grade - 6"), value: "6"),
      DropdownMenuItem(child: Text("Grade - 7"), value: "7"),
      DropdownMenuItem(child: Text("Grade - 8"), value: "8"),
      DropdownMenuItem(child: Text("Grade - 9"), value: "9"),
      DropdownMenuItem(child: Text("Grade - 10 (Bio)"), value: "10B"),
      DropdownMenuItem(child: Text("Grade - 10 (Eco)"), value: "10E"),
      DropdownMenuItem(child: Text("Grade - 11 (Bio)"), value: "11B"),
      DropdownMenuItem(child: Text("Grade - 11 (Eco)"), value: "11E")
    ];
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
    emailFocus = FocusNode();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Check Identity',
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
              padding: EdgeInsets.all(Dimension.height10),
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
                  Container(
                    width: Dimension.height175 - Dimension.height25,
                    height: Dimension.height175 - Dimension.height25,
                    child: Image.asset('assets/img/blurFOEIM.png'),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  Text(
                    'FOEIM E-CLASSES',
                    style: TextStyle(
                      color: AppColors.imageColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height10,
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
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(emailFocus);
                        },
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
                  SizedBox(
                    height: Dimension.height10,
                  ),

                  //Email Textfield
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
                        focusNode: emailFocus,
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
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
                  SizedBox(height: Dimension.height10),
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimension.height10, right: Dimension.height10),
                    width: double.maxFinite,
                    child: Center(
                      child: DropdownButton(
                          isExpanded: true,
                          value: selectedValue,
                          items: dropdownItems,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
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
                          String name = nameController.text.trim().toString();
                          String email = emailController.text.trim().toString();
                          if (name.isNotEmpty &&
                              email.isNotEmpty &&
                              selectedValue != "unselect") {
                            setState(() {
                              isComplete = true;
                            });
                            Get.find<IdentityController>().isLoaded = false;
                            Get.find<IdentityController>()
                                .getIdentityData(name, email, selectedValue);
                            Get.toNamed(IdentityCard.routeName);
                          } else {
                            setState(() {
                              isComplete = false;
                            });
                          }
                        }),
                  ),

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
