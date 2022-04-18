import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/auth_controller.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/OtpScreen';
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  late List<String> arg;
  late String email;
  late String pw;
  @override
  void initState() {
    super.initState();

    arg = Get.arguments;
    email = arg[0];
    pw = arg[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Dimension.height100,
              height: Dimension.height100,
              child: Image.asset("assets/img/otp.png"),
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            const Text(
              'Verification',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dimension.height10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Dimension.height20),
              child: Text(
                'We sent verification OTP code to $email',
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Dimension.height60,
            ),
            //OTP TextField
            Container(
              width: Dimension.screenWidth * 0.8,
              height: Dimension.height50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.height5),
                  border: Border.all(color: Colors.lightBlue, width: 1)),
              child: Center(
                child: TextField(
                    controller: otpController,
                    obscureText: true,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    showCursor: false,
                    decoration: InputDecoration(
                        hintText: 'Enter Your OTP',
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
                            borderRadius:
                                BorderRadius.circular(Dimension.height35)))),
              ),
            ),
            SizedBox(
              height: Dimension.height20,
            ),

            //Verify Btn
            Obx(() {
              return Container(
                width: Dimension.screenWidth * 0.8,
                height: Dimension.height50,
                child: ElevatedButton(
                  onPressed: () {
                    if (otpController.text.isNotEmpty) {
                      Get.find<AuthController>()
                          .verifyOTP(email, otpController.text.trim())
                          .then((message) async {
                        if (message == "success") {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("loginStatus", true);
                          prefs.setString("email", email);
                          prefs.setString("pw", pw);
                          Get.offAllNamed(HomeScreen.routeName);
                        } else {
                          Get.snackbar('Incorrect OTP!',
                              'Please check your email and enter correct OTP.',
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        }
                      });
                    } else {
                      Get.snackbar('Please enter your OTP!',
                          'OTP code need to be enter to verify your account.',
                          backgroundColor: Colors.red, colorText: Colors.white);
                    }
                  },
                  child: Get.find<AuthController>().isLoaded.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'VERIFY',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
