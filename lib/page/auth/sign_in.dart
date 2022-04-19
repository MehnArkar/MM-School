import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/auth_controller.dart';
import 'package:mm_school/page/auth/sign_up.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:mm_school/page/widgets/app_text_field.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/SignInScreen';
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimension.screenHeight * 0.05,
            ),
            //App Logo
            Container(
              width: Dimension.height100 + Dimension.height35,
              height: Dimension.height100 + Dimension.height35,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/app_logo_crop.png'),
                      fit: BoxFit.cover)),
            ),
            //Hello Tags
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimension.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                        fontSize: Dimension.height10 * 7,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Sign into your account',
                    style: TextStyle(
                        fontSize: Dimension.fontsize20,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            //email
            AppTextField(
              textController: emailController,
              icon: Icons.mail,
              hintText: 'Email',
              isPass: false,
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            //passwored
            AppTextField(
              textController: passwordController,
              icon: Icons.password_outlined,
              hintText: 'Password',
              isPass: true,
            ),
            SizedBox(
              height: Dimension.screenHeight * 0.05,
            ),

            //Sign In btn
            GestureDetector(
              onTap: () async {
                String email = emailController.text.trim();
                String pw = passwordController.text.trim();
                if (email.isNotEmpty & pw.isNotEmpty) {
                  authController.logIn(email, pw).then((value) async {
                    if (authController.userModel.user.isNotEmpty) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("loginStatus", true);
                      prefs.setString("email", email);
                      prefs.setString("pw", pw);
                      Get.offAllNamed(HomeScreen.routeName);
                    } else {
                      Get.snackbar(
                          'Fail to Sign In!', 'Incorrect email or password',
                          backgroundColor: Colors.red, colorText: Colors.white);
                    }
                  });
                } else {
                  Get.snackbar('Enter email and password!',
                      'Please enter your email and password.',
                      backgroundColor: Colors.red, colorText: Colors.white);
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
                              "SIGN IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimension.fontsize20 +
                                    Dimension.fontsize20 / 2,
                              ),
                            ),
                    );
                  })),
            ),

            SizedBox(
              height: Dimension.screenHeight * 0.05,
            ),
            //tag line
            RichText(
              text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimension.fontsize20),
                  children: [
                    TextSpan(
                        text: 'Create',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(
                                () => SignUp(),
                              ),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimension.fontsize20,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
