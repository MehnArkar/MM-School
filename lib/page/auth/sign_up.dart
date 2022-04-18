import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/auth_controller.dart';
import 'package:mm_school/page/auth/otp_screen.dart';
import 'package:mm_school/page/widgets/app_text_field.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:device_info_plus/device_info_plus.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/SignUpScreen';
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var fullNameController = TextEditingController();
  var profileNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String accountType = "unselect";

  //Year dropdown
  List<DropdownMenuItem<String>> get accTypeDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Account Type"), value: "unselect"),
      const DropdownMenuItem(child: Text("Parent"), value: "Parent"),
      const DropdownMenuItem(child: Text("Teacher"), value: "Teacher"),
      const DropdownMenuItem(child: Text("Student"), value: "Student"),
      const DropdownMenuItem(child: Text("Volunteer"), value: "Volunteer"),
      const DropdownMenuItem(
          child: Text("Self Learner"), value: "Self Learner"),
    ];
    return menuItems;
  }

  //Get device id
  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();

    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimension.screenHeight * 0.05),
            //App Logo
            Container(
              width: Dimension.height100 + Dimension.height35,
              height: Dimension.height100 + Dimension.height35,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/app_logo_crop.png'),
                      fit: BoxFit.cover)),
            ),

            //Full Name
            AppTextField(
              textController: fullNameController,
              icon: Icons.person,
              hintText: 'Full Name',
              isPass: false,
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            //Profile Name
            AppTextField(
              textController: profileNameController,
              icon: Icons.person,
              hintText: 'Profile Name',
              isPass: false,
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            //Email
            AppTextField(
              textController: emailController,
              icon: Icons.email,
              hintText: 'Email',
              isPass: false,
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            //Account Type
            Container(
              height: Dimension.height10 * 5.5,
              margin: EdgeInsets.only(
                  left: Dimension.height20, right: Dimension.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Dimension.height10 * 7 / 2),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 8),
                        blurRadius: 8,
                        spreadRadius: 6,
                        color: Colors.grey.withOpacity(0.2)),
                  ]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_pin_rounded,
                        color: Colors.blue[400],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            value: accountType,
                            items: accTypeDropdownItems,
                            onChanged: (String? newValue) {
                              setState(() {
                                accountType = newValue!;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            //Password
            AppTextField(
              textController: passwordController,
              icon: Icons.password,
              hintText: 'Password',
              isPass: false,
            ),

            SizedBox(
              height: Dimension.height30,
            ),
            //Sign Up btn
            GestureDetector(
              onTap: () async {
                String name = fullNameController.text.trim();
                String nName = profileNameController.text.trim();
                String email = emailController.text.trim();
                String accType = accountType;
                String password = passwordController.text.trim();
                String? deviceID = await _getId();
                if (name.isEmpty ||
                    nName.isEmpty ||
                    email.isEmpty ||
                    accType == "unselect" ||
                    password.isEmpty ||
                    deviceID == null) {
                  Get.snackbar(
                      'Data require!', 'Please fill all of require data.',
                      backgroundColor: Colors.red, colorText: Colors.white);
                } else {
                  Get.find<AuthController>()
                      .signUpUser(
                          name, nName, email, accType, password, deviceID)
                      .then((message) {
                    if (message == "success") {
                      Get.toNamed(OtpScreen.routeName,
                          arguments: [email, password]);
                    } else if (message == "exist") {
                      Get.snackbar('Email already exist!',
                          'You already registered your account.Please Sign In',
                          backgroundColor: Colors.red, colorText: Colors.white);
                    } else if (message == "error") {
                      Get.snackbar('Something wrong!',
                          'Something went wrong during registration.',
                          backgroundColor: Colors.red, colorText: Colors.white);
                    }
                  });
                }
              },
              child: Container(
                width: Dimension.screenWidth / 2,
                height: Dimension.screenHeight / 13,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(Dimension.height35),
                ),
                child: Obx(() {
                  return Center(
                    child: authController.isLoaded.value
                        ? SizedBox(
                            width: Dimension.height30,
                            height: Dimension.height30,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "SIGN UP",
                            style: TextStyle(
                                fontSize: Dimension.fontsize20 +
                                    Dimension.fontsize20 / 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: Dimension.height10,
            ),
            //Sign in text
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Already have an account?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimension.fontsize20))),
          ],
        ),
      ),
    );
  }
}
